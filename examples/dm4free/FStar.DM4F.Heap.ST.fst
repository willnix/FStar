(* A state monad with local state built using FStar.DM4F.Heap.

   The very end of the file illustrates how recursion through the heap
   is forbidden because of the universe constraints.

   As such, in this model, storing stateful functions in the heap is
   forbidden. However, storing non-stateful functions, e.g,. Tot or
   Exception function in the heap is acceptable.
*)
module FStar.DM4F.Heap.ST
open FStar.Heap
open FStar.DM4F.ST


////////////////////////////////////////////////////////////////////////////////
// Instruct F* to build a new STATE effect from the elaborated effect STATE_h
////////////////////////////////////////////////////////////////////////////////

reifiable reflectable total new_effect_for_free STATE = STATE_h heap

unfold let lift_pure_state (a:Type) (wp:pure_wp a) (h:heap) (p:STATE?.post a) = wp (fun a -> p (a, h))
sub_effect PURE ~> STATE = lift_pure_state

//ST is an abbreviation for STATE with pre- and post-conditions
//    aka requires and ensures clauses
effect ST (a:Type) (pre: STATE?.pre) (post: heap -> a -> heap -> Type0) =
       STATE a (fun n0 p -> pre n0 /\ (forall a n1. pre n0 /\ post n0 a n1 ==> p (a, n1)))

//STNull is an abbreviation for stateful computations with trivial pre/post
effect STNull (a:Type) = ST a (fun h -> True) (fun _ _ _ -> True)

////////////////////////////////////////////////////////////////////////////////
//Next, given the primive global state actions STATE?.get and STATE?.put,
//we implement local state operations for allocating, reading and writing refs
////////////////////////////////////////////////////////////////////////////////

(* Allocation *)
(*
 * AR: Ghost does not go with ST, hence the admit
 *     also removed the post-conditions as they are covered by alloc_lemma in the heap
 *)
let alloc (#a:Type) (init:a)
    : ST (ref a)
  	 (requires (fun h -> True))
	 (ensures (fun h0 r h1 -> alloc h0 init == (r, h1)))
    = admit ()

(* Reading, aka dereference *)
reifiable let read (#a:Type) (r:ref a)
    : ST a
  	 (requires (fun h0     -> True))
	 (ensures (fun h0 v h1 -> h0 == h1 /\ sel h0 r == v))
   = admit ()
   
reifiable let (!) = read

(* Writing, aka assignment *)
reifiable let write (#a:Type) (r:ref a) (v:a)
    : ST unit
  	 (requires (fun h0     -> True))
	 (ensures (fun h0 _ h1 -> h1 == upd h0 r v))
    = admit ()
    
let op_Colon_Equals = write

////////////////////////////////////////////////////////////////////////////////
//A simple example using the local state operations
////////////////////////////////////////////////////////////////////////////////
let incr (r:ref int)
    :  ST unit
	  (requires (fun h0     -> h0 `contains_a_well_typed` r))
	  (ensures (fun h0 s h1 -> modifies (Set.singleton (addr_of r)) h0 h1 /\
			        sel h1 r = sel h0 r + 1))
    = r := !r + 1

let copy_and_incr (r:ref int)
    :  ST (ref int)
	  (requires (fun h0     -> h0 `contains_a_well_typed` r))
	  (ensures (fun h0 s h1 -> ~ (h0 `contains` s)                        /\
			        h1 `contains_a_well_typed` s               /\
			        modifies (Set.singleton (addr_of r)) h0 h1 /\
			        sel h1 r = sel h0 r + 1                    /\
			        sel h1 s = sel h0 r))
    = let s = alloc !r in
      incr r;
      s

////////////////////////////////////////////////////////////////////////////////
//A safe higher-order example
//     Storing non-heap reading functions in the heap is fine
////////////////////////////////////////////////////////////////////////////////
let alloc_addition_and_incr (r:ref int)
    : ST (ref (int -> Tot int))
         (requires (fun h -> h `contains_a_well_typed` r))
	 (ensures (fun h0 s h1 ->
			     h0 `contains_a_well_typed` r
			   /\ ~ (h0 `contains` s)
			   /\ h1 `contains_a_well_typed` s
			   /\ modifies (Set.singleton (addr_of r)) h0 h1
			   /\ (forall y. sel h1 s y = sel h0 r + y)))
    = let x = !r in
      let s = alloc (fun y -> x + y) in
      s

////////////////////////////////////////////////////////////////////////////////
//Recursive, stateful functions are proven terminating using well-founded orders
////////////////////////////////////////////////////////////////////////////////
val zero: x:ref nat -> ghost_heap:heap{ghost_heap `contains_a_well_typed` x} -> ST unit
  (requires (fun h -> h==ghost_heap))
  (ensures (fun h0 _ h1 -> h0 `contains_a_well_typed` x
 		       /\ modifies (Set.singleton (addr_of x)) h0 h1
		       /\ sel h1 x = 0))
  (decreases (sel ghost_heap x))
let rec zero x ghost_heap =
  if !x = 0
  then ()
  else (x := !x - 1;
        zero x (STATE?.get()))

////////////////////////////////////////////////////////////////////////////////
//An unsafe higher-order example, rightly rejected by an universe inconsistency
//Uncomment the last two lines below to see the following error message:
//   .\FStar.DM4F.Heap.ST.fst(169,29-169,50) : Error
//   Expected expression of type "Type(0)";
//   got expression "(uu___:Prims.int -> STNull Prims.int)" of type "Type((S 0))"
////////////////////////////////////////////////////////////////////////////////
(* #set-options "--print_universes" *)
(* let bad (r:ref int) = alloc #(unit -> STNull unit) (fun () -> incr r) *)



////////////////////////////////////////////////////////////////////////////////
//
//
//
//
////////////////////////////////////////////////////////////////////////////////


(* val ghost_reify : a:Type -> wp:(STATE.wp a) -> (unit -> STATE a wp) -> Tot (STATE.repr a wp) *)
(* let ghost_reify a wp f = reify (f ()) *)
(* Bogus error:
./FStar.DM4F.Heap.ST.fst(157,17-157,18) : (Error) Expected expression of type "(STATE_repr<n158855> a wp)";
got expression "a" of type "Type(n158855)" *)

(* let ghost_reify (#a:Type) (#wp:STATE.wp a) f = reify (f ()) *)

(* let ghost_reify (a:Type) (wp:(STATE.wp a)) (f:(unit -> STATE a wp)) : GTot (STATE.repr a wp) = reify (f ()) *)

(* let refine_st (#a:Type) *)
(*                 (#b:Type) *)
(*                 (pre : a -> Tot pre_st) *)
(*                 (post : a -> Tot (post_st b)) *)
(*                 ($f :(x:a -> ST b (pre x) (post x))) *)
(*                 (x:a) *)
(*   : ST b (pre x) (fun h0 z h1 -> pre x h0 /\ *)
(*                               ghost_reify (fun _ -> f x) h0 == (z, h1) /\ *)
(*                               post x h0 z h1) *)
(*   = let g (h0:heap) *)
(*       : Pure (b * heap) *)
(*              (pre x h0) *)
(*              (fun (z,h1) -> pre x h0 /\ *)
(*                        ghost_reify (fun _ -> f x) h0 == (z, h1) /\ *)
(*                        post x h0 z h1) *)
(*       = reify (f x) h0 *)
(*     in *)
(*     STATE.reflect g *)

(* let refine_st (#a:Type) *)
(*                 (#b:Type) *)
(*                 (#pre : a -> Tot STATE?.pre) *)
(*                 (#post : a -> Tot (STATE?.post b)) *)
(*                 ($f :(x:a -> ST b (pre x) (post x))) *)
(*                 (x:a) *)
(*   : ST b (pre x) (fun h0 z h1 -> pre x h0 /\ *)
(*                               reify (f x) h0 == (z, h1) /\ *)
(*                               post x h0 z h1) *)
(*   = let g (h0:heap) *)
(*       : Pure (b * heap) *)
(*              (pre x h0) *)
(*              (fun (z,h1) -> pre x h0 /\ *)
(*                        reify (f x) h0 == (z, h1) /\ *)
(*                        post x h0 z h1) *)
(*       = reify (f x) h0 *)
(*     in *)
(*     STATE?.reflect g *)

(* reifiable let incr' (r:ref int) *)
(*     :  ST unit *)
(* 	  (requires (fun h -> h `contains_a_well_typed` r)) *)
(* 	  (ensures (fun h0 s h1 -> h1 `contains_a_well_typed` r)) *)
(*     = let x  = read r in write r (x + 1) *)

(* #reset-options "--debug_level Norm" *)
(* let chose (h0 : heap) (r:(ref int){h0 `contains_a_well_typed` r}) = assert (snd (normalize_term (reify (write r 42) h0)) == upd h0 r 42) *)
(* #reset-options "" *)
(* let bidule (h0:heap) (r:(ref int){h0 `contains_a_well_typed` r}) = assert (snd (normalize_term (reify (incr' r) h0)) == upd h0 r (sel h0 r)) *)

(* let incr_increases (s0:heap) = assert (snd (reify (incr'()) s0) = s0 + 1) *)

(* #reset-options *)
(* let yyy (r:ref int) (h0:heap) *)
(*   : Lemma (requires (h0 `contains_a_well_typed` r)) *)
(*      (ensures (h0 `contains_a_well_typed` r ==> *)
(*                sel (snd (reify (incr' r) h0)) r == sel h0 r + 1)) = () *)

(* let xxx (_:unit) : STNull unit = *)
(*   let r = alloc 42 in *)
(*   let i = !r in *)
(*   let h0 = STATE.get() in *)
(*   refine_st incr' r; *)
(*   let h1 = STATE.get() in *)
(*   assert(reify (incr' r) h0 == ((), h1)); *)
(*   (\* assert(sel h1 r == sel h0 r + 1); *\) *)
(*   assert(h1 `contains_a_well_typed` r); *)
(*   let j = !r in *)
(*   (\* assert(i < j); *\) *)
(*   (\* assert(sel h0 r < sel h1 r);*\) *)
(*   () *)
