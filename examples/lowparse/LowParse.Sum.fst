module LowParse.Sum
include LowParse.Enum

module S = LowParse.Slice
module T = FStar.Tactics

val parse_tagged_union
  (#tag: Type0)
  (#tu: tag -> Type0)
  (pt: parser tag)
//  (p: parse_arrow (t: tag) (fun t -> parser (tu t)))
  (p: (t: tag) -> Tot (parser (tu t))) // Tot really needed here by validator
: Tot (parser (t: tag & tu t))

let parse_tagged_union #tag #tu pt p =
  pt `and_then` (fun (v: tag) ->
    let pv : parser (tu v) = p v in
    let synth : tu v -> Tot (t: tag & tu t) = fun (v': tu v) -> (| v, v' |) in
    parse_synth #(tu v) #(t: tag & tu t) pv synth
  )

inline_for_extraction
let sum = (repr: eqtype & (e: enum repr & ((x: enum_key e) -> Tot Type0)))

inline_for_extraction
let sum_key_repr (t: sum) : Tot eqtype =
  let (| repr,  _ |) = t in repr

let sum_enum (t: sum) : Tot (enum (sum_key_repr t)) =
  let (| _, (| e, _ |) |) = t in e

let sum_key (t: sum) : Tot Type0 =
  enum_key (sum_enum t)

let sum_cases (t: sum) : Tot ((x: sum_key t) -> Tot Type0) =
  let (|_, (| _, c |) |) = t in c

let sum_data (t: sum) : Tot Type0 =
  (x: sum_key t & sum_cases t x)

let parse_sum
  (t: sum)
  (p: parser (sum_key_repr t))
  (pc: ((x: sum_key t) -> Tot (parser (sum_cases t x))))
: Tot (parser (sum_data t))
= parse_tagged_union
    #(sum_key t)
    #(sum_cases t)
    (parse_enum_key p (sum_enum t))
    pc

inline_for_extraction
let make_sum
  (#repr: eqtype)
  (e: enum repr)
  (cases: (enum_key e -> Tot Type0))
: Tot sum
= (| repr, (| e, cases |) |)

let lift_cases
  (#repr: eqtype)
  (e: enum repr)
  (cases: (enum_key e -> Tot Type0))
  (k: maybe_unknown_key e)
: Tot Type0
= match k with
  | Known k' -> cases k'
  | _ -> False

let lift_parser_cases
  (#repr: eqtype)
  (e: enum repr)
  (cases: (enum_key e -> Tot Type0))
  (pc: ((x: enum_key e) -> Tot (parser (cases x))))
  (k: maybe_unknown_key e)
: Tot (parser (lift_cases e cases k))
= match k with
  | Known k' -> pc k'
  | _ -> fail_parser

inline_for_extraction
val gen_validate_sum_partial
  (t: sum)
  (p: parser (sum_key_repr t))
  (ps: parser_st p)
  (pc: ((x: sum_key t) -> Tot (parser (sum_cases t x))))
  (vs' : ((x: sum_key_repr t) -> Tot (stateful_validator (lift_parser_cases (sum_enum t) (sum_cases t) pc (maybe_unknown_key_of_repr (sum_enum t) x)))))
: Tot (stateful_validator (parse_sum t p pc))

let gen_validate_sum_partial t p ps pc vs' =
  (fun input ->
  match ps input with
  | Some (v1, off1) ->
    let input2 = S.advance_slice input off1 in
    begin match vs' v1 input2 with
    | Some off2 ->
      Some (UInt32.add off1 off2 <: consumed_slice_length input)
    | _ -> None
    end
  | _ -> None) <: (stateful_validator (parse_sum t p pc))

inline_for_extraction
let lift_validator_cases
  (#repr: eqtype)
  (e: enum repr)
  (cases: (enum_key e -> Tot Type0))
  (pc: ((x: enum_key e) -> Tot (parser (cases x))))
  (vs: ((x: enum_key e) -> Tot (stateful_validator (pc x))))
  (k: maybe_unknown_key e)
: Tot (stateful_validator (lift_parser_cases e cases pc k))
= match k with
  | Known k' -> vs k'
  | _ -> validate_fail #False
