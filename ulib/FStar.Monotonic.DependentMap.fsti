module FStar.Monotonic.DependentMap
(** A library for mutable partial, dependent maps,
    that grow monotonically,
    while subject to an invariant on the entire map *)
open FStar.HyperStack.ST
module HH = FStar.HyperHeap
module HS = FStar.HyperStack
module MR = FStar.Monotonic.RRef
module DM = FStar.DependentMap

/// The logical model of the map is given in terms of DM.t///
let opt (#a:eqtype) (b:a -> Type) = fun (x:a) -> option (b x)
let partial_dependent_map (a:eqtype) (b:a -> Type) =
    DM.t a (opt b)

/// An empty partial, dependent map maps all keys to None
let empty_partial_dependent_map (#a:_) (#b:_)
  : partial_dependent_map a b
  = DM.create #a #(opt b) (fun x -> None)
////////////////////////////////////////////////////////////////////////////////

/// `map a b`: Internally, the model is implemented using this abstract type
///    These maps provide three operations:
///      - empty, sel, upd
///    Which are proven to be in correspondence with the operations on DM.t
///    via the homomorphism `repr` below
val map
    (a:eqtype u#a)
    (b:(a -> Type u#b))
  : Type u#(max a b)

/// `repr m`: A ghost function that reveals the internal `map` as a `DM.t`
val repr (#a:_) (#b:_)
    (r:map a b)
  : GTot (partial_dependent_map a b)

/// An `empty : map a b` is equivalent to the `empty_partial_dependent_map`
val empty (#a:_) (#b:_)
  : r:map a b{repr r == empty_partial_dependent_map}

/// Selecting a key from a map `sel r x` is equivalent to selecting it from its `repr`
val sel (#a:_) (#b:_)
    (r:map a b)
    (x:a)
  : Tot (o:option (b x){DM.sel (repr r) x == o})

/// Updating a map using `upd r x v` is equivalent to updating its repr
val upd (#a:_) (#b:_)
    (r:map a b)
    (x:a)
    (v:b x)
  : Tot (r':map a b{repr r' == DM.upd (repr r) x (Some v)})

/// `imap a b inv` further augments a map with an invariant on its repr
let imap (a:eqtype) (b: a -> Type) (inv:DM.t a (opt b) -> Type) =
    r:map a b{inv (repr r)}

/// `grows r1 r2` is an abstract preorder on `imap`
val grows (#a:_) (#b:_) (#inv:DM.t a (opt b) -> Type)
  : FStar.Preorder.preorder (imap a b inv)

/// And, finally, the main type of this module:
///
/// `t r a b inv` is a mutable, imap stored in region `r` constrained
///               to evolve according to `grows`
let t (r:MR.rid) (a:eqtype) (b:a -> Type) (inv:DM.t a (opt b) -> Type) =
    MR.m_rref r (imap a b inv) grows

/// `defined t x h`: In state `h`, map `t` is defined at point `x`.
let defined
    (#a:eqtype)
    (#b:a -> Type)
    (#inv:DM.t a (opt b) -> Type)
    (#r:MR.rid)
    (t:t r a b inv)
    (x:a)
    (h:HS.mem)
  : GTot Type0
  = Some? (sel (MR.m_sel h t) x)

/// `contains t x y h`: In state `h`, `t` maps `x` to `y`
let contains
    (#a:eqtype)
    (#b:a -> Type)
    (#inv:DM.t a (opt b) -> Type)
    (#r:MR.rid)
    (t:t r a b inv)
    (x:a)
    (y:b x)
    (h:HS.mem)
  : GTot Type0
  = defined t x h /\
    Some?.v (sel (MR.m_sel h t) x) == y

////////////////////////////////////////////////////////////////////////////////
// Interface of stateful operations
////////////////////////////////////////////////////////////////////////////////

/// `alloc ()`: Allocating a new `t` requires proving the `inv` of the empty map
val alloc (#a:eqtype) (#b:a -> Type) (#inv:DM.t a (opt b) -> Type) (#r:MR.rid)
    (_:unit{inv (repr empty)})
  : ST (t r a b inv)
       (requires (fun h -> True))
       (ensures (fun h0 x h1 ->
         ralloc_post r empty h0 (MR.as_hsref x) h1))

/// `extend t x y`: Extending `t` with (x -> y)
///     Requires: - proving that the `t` does not already define `x`
///               - and that the resulting heap would still respect `inv`
///     Ensures:  - that only `t` is modified
///               - by updating it to contain `(x -> y)`
///               - and in the future `t` will always contain `(x -> y)`
//This really should be hidden inside the MR library
let addr_of (#r:_) (#a:_) (#b:_) (m:MR.m_rref r a b) : GTot nat =
    let x = MR.as_hsref m in
    Heap.addr_of (HH.as_ref (HS.MkRef?.ref x))

val extend
    (#a:eqtype)
    (#b:a -> Type)
    (#inv:DM.t a (opt b) -> Type)
    (#r:MR.rid)
    (t:t r a b inv)
    (x:a)
    (y:b x)
  : ST unit
       (requires (fun h ->
         ~(defined t x h) /\
         inv (repr (upd (MR.m_sel h t) x y))))
       (ensures (fun h0 u h1 ->
         let cur = MR.m_sel h0 t in
         MR.m_contains t h1 /\
         HS.modifies (Set.singleton r) h0 h1 /\
         HH.modifies_rref r (Set.singleton (addr_of t)) HS.(h0.h) HS.(h1.h) /\
         MR.m_sel h1 t == upd cur x y /\
         MR.witnessed (contains t x y)))

/// `lookup t x`: Querying the map `t` at point `x`
///      Ensures: - The state does not change
///               - If it returns `Some v`, then `t` will always contains `x -> v`
val lookup
    (#a:eqtype)
    (#b:a -> Type)
    (#inv:DM.t a (opt b) -> Type)
    (#r:MR.rid)
    (t:t r a b inv)
    (x:a)
  : ST (option (b x))
       (requires (fun h -> True))
       (ensures (fun h0 y h1 ->
         h0==h1 /\
         y == sel (MR.m_sel h1 t) x /\
         (match y with
          | None -> ~(defined t x h1)
          | Some v ->
            contains t x v h1 /\
            MR.witnessed (contains t x v))))
