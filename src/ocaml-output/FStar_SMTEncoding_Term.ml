open Prims
type sort =
  | Bool_sort
  | Int_sort
  | String_sort
  | Term_sort
  | Fuel_sort
  | BitVec_sort of Prims.int
  | Array of (sort,sort) FStar_Pervasives_Native.tuple2
  | Arrow of (sort,sort) FStar_Pervasives_Native.tuple2
  | Sort of Prims.string[@@deriving show]
let uu___is_Bool_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Bool_sort  -> true | uu____28 -> false
let uu___is_Int_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Int_sort  -> true | uu____32 -> false
let uu___is_String_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | String_sort  -> true | uu____36 -> false
let uu___is_Term_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Term_sort  -> true | uu____40 -> false
let uu___is_Fuel_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Fuel_sort  -> true | uu____44 -> false
let uu___is_BitVec_sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | BitVec_sort _0 -> true | uu____49 -> false
let __proj__BitVec_sort__item___0: sort -> Prims.int =
  fun projectee  -> match projectee with | BitVec_sort _0 -> _0
let uu___is_Array: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Array _0 -> true | uu____65 -> false
let __proj__Array__item___0:
  sort -> (sort,sort) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | Array _0 -> _0
let uu___is_Arrow: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Arrow _0 -> true | uu____93 -> false
let __proj__Arrow__item___0:
  sort -> (sort,sort) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | Arrow _0 -> _0
let uu___is_Sort: sort -> Prims.bool =
  fun projectee  ->
    match projectee with | Sort _0 -> true | uu____117 -> false
let __proj__Sort__item___0: sort -> Prims.string =
  fun projectee  -> match projectee with | Sort _0 -> _0
let rec strSort: sort -> Prims.string =
  fun x  ->
    match x with
    | Bool_sort  -> "Bool"
    | Int_sort  -> "Int"
    | Term_sort  -> "Term"
    | String_sort  -> "FString"
    | Fuel_sort  -> "Fuel"
    | BitVec_sort n1 ->
        let uu____129 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "(_ BitVec %s)" uu____129
    | Array (s1,s2) ->
        let uu____132 = strSort s1 in
        let uu____133 = strSort s2 in
        FStar_Util.format2 "(Array %s %s)" uu____132 uu____133
    | Arrow (s1,s2) ->
        let uu____136 = strSort s1 in
        let uu____137 = strSort s2 in
        FStar_Util.format2 "(%s -> %s)" uu____136 uu____137
    | Sort s -> s
type op =
  | TrueOp
  | FalseOp
  | Not
  | And
  | Or
  | Imp
  | Iff
  | Eq
  | LT
  | LTE
  | GT
  | GTE
  | Add
  | Sub
  | Div
  | Mul
  | Minus
  | Mod
  | BvAnd
  | BvXor
  | BvOr
  | BvAdd
  | BvSub
  | BvShl
  | BvShr
  | BvUdiv
  | BvMod
  | BvMul
  | BvUlt
  | BvUext of Prims.int
  | NatToBv of Prims.int
  | BvToNat
  | ITE
  | Var of Prims.string[@@deriving show]
let uu___is_TrueOp: op -> Prims.bool =
  fun projectee  ->
    match projectee with | TrueOp  -> true | uu____154 -> false
let uu___is_FalseOp: op -> Prims.bool =
  fun projectee  ->
    match projectee with | FalseOp  -> true | uu____158 -> false
let uu___is_Not: op -> Prims.bool =
  fun projectee  -> match projectee with | Not  -> true | uu____162 -> false
let uu___is_And: op -> Prims.bool =
  fun projectee  -> match projectee with | And  -> true | uu____166 -> false
let uu___is_Or: op -> Prims.bool =
  fun projectee  -> match projectee with | Or  -> true | uu____170 -> false
let uu___is_Imp: op -> Prims.bool =
  fun projectee  -> match projectee with | Imp  -> true | uu____174 -> false
let uu___is_Iff: op -> Prims.bool =
  fun projectee  -> match projectee with | Iff  -> true | uu____178 -> false
let uu___is_Eq: op -> Prims.bool =
  fun projectee  -> match projectee with | Eq  -> true | uu____182 -> false
let uu___is_LT: op -> Prims.bool =
  fun projectee  -> match projectee with | LT  -> true | uu____186 -> false
let uu___is_LTE: op -> Prims.bool =
  fun projectee  -> match projectee with | LTE  -> true | uu____190 -> false
let uu___is_GT: op -> Prims.bool =
  fun projectee  -> match projectee with | GT  -> true | uu____194 -> false
let uu___is_GTE: op -> Prims.bool =
  fun projectee  -> match projectee with | GTE  -> true | uu____198 -> false
let uu___is_Add: op -> Prims.bool =
  fun projectee  -> match projectee with | Add  -> true | uu____202 -> false
let uu___is_Sub: op -> Prims.bool =
  fun projectee  -> match projectee with | Sub  -> true | uu____206 -> false
let uu___is_Div: op -> Prims.bool =
  fun projectee  -> match projectee with | Div  -> true | uu____210 -> false
let uu___is_Mul: op -> Prims.bool =
  fun projectee  -> match projectee with | Mul  -> true | uu____214 -> false
let uu___is_Minus: op -> Prims.bool =
  fun projectee  ->
    match projectee with | Minus  -> true | uu____218 -> false
let uu___is_Mod: op -> Prims.bool =
  fun projectee  -> match projectee with | Mod  -> true | uu____222 -> false
let uu___is_BvAnd: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvAnd  -> true | uu____226 -> false
let uu___is_BvXor: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvXor  -> true | uu____230 -> false
let uu___is_BvOr: op -> Prims.bool =
  fun projectee  -> match projectee with | BvOr  -> true | uu____234 -> false
let uu___is_BvAdd: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvAdd  -> true | uu____238 -> false
let uu___is_BvSub: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvSub  -> true | uu____242 -> false
let uu___is_BvShl: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvShl  -> true | uu____246 -> false
let uu___is_BvShr: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvShr  -> true | uu____250 -> false
let uu___is_BvUdiv: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvUdiv  -> true | uu____254 -> false
let uu___is_BvMod: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvMod  -> true | uu____258 -> false
let uu___is_BvMul: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvMul  -> true | uu____262 -> false
let uu___is_BvUlt: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvUlt  -> true | uu____266 -> false
let uu___is_BvUext: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvUext _0 -> true | uu____271 -> false
let __proj__BvUext__item___0: op -> Prims.int =
  fun projectee  -> match projectee with | BvUext _0 -> _0
let uu___is_NatToBv: op -> Prims.bool =
  fun projectee  ->
    match projectee with | NatToBv _0 -> true | uu____283 -> false
let __proj__NatToBv__item___0: op -> Prims.int =
  fun projectee  -> match projectee with | NatToBv _0 -> _0
let uu___is_BvToNat: op -> Prims.bool =
  fun projectee  ->
    match projectee with | BvToNat  -> true | uu____294 -> false
let uu___is_ITE: op -> Prims.bool =
  fun projectee  -> match projectee with | ITE  -> true | uu____298 -> false
let uu___is_Var: op -> Prims.bool =
  fun projectee  ->
    match projectee with | Var _0 -> true | uu____303 -> false
let __proj__Var__item___0: op -> Prims.string =
  fun projectee  -> match projectee with | Var _0 -> _0
type qop =
  | Forall
  | Exists[@@deriving show]
let uu___is_Forall: qop -> Prims.bool =
  fun projectee  ->
    match projectee with | Forall  -> true | uu____314 -> false
let uu___is_Exists: qop -> Prims.bool =
  fun projectee  ->
    match projectee with | Exists  -> true | uu____318 -> false
type term' =
  | Integer of Prims.string
  | BoundV of Prims.int
  | FreeV of (Prims.string,sort) FStar_Pervasives_Native.tuple2
  | App of (op,term Prims.list) FStar_Pervasives_Native.tuple2
  | Quant of
  (qop,term Prims.list Prims.list,Prims.int FStar_Pervasives_Native.option,
  sort Prims.list,term) FStar_Pervasives_Native.tuple5
  | Let of (term Prims.list,term) FStar_Pervasives_Native.tuple2
  | Labeled of (term,Prims.string,FStar_Range.range)
  FStar_Pervasives_Native.tuple3
  | LblPos of (term,Prims.string) FStar_Pervasives_Native.tuple2[@@deriving
                                                                  show]
and term =
  {
  tm: term';
  freevars:
    (Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list
      FStar_Syntax_Syntax.memo;
  rng: FStar_Range.range;}[@@deriving show]
let uu___is_Integer: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Integer _0 -> true | uu____432 -> false
let __proj__Integer__item___0: term' -> Prims.string =
  fun projectee  -> match projectee with | Integer _0 -> _0
let uu___is_BoundV: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | BoundV _0 -> true | uu____444 -> false
let __proj__BoundV__item___0: term' -> Prims.int =
  fun projectee  -> match projectee with | BoundV _0 -> _0
let uu___is_FreeV: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | FreeV _0 -> true | uu____460 -> false
let __proj__FreeV__item___0:
  term' -> (Prims.string,sort) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | FreeV _0 -> _0
let uu___is_App: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | App _0 -> true | uu____490 -> false
let __proj__App__item___0:
  term' -> (op,term Prims.list) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | App _0 -> _0
let uu___is_Quant: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Quant _0 -> true | uu____538 -> false
let __proj__Quant__item___0:
  term' ->
    (qop,term Prims.list Prims.list,Prims.int FStar_Pervasives_Native.option,
      sort Prims.list,term) FStar_Pervasives_Native.tuple5
  = fun projectee  -> match projectee with | Quant _0 -> _0
let uu___is_Let: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Let _0 -> true | uu____610 -> false
let __proj__Let__item___0:
  term' -> (term Prims.list,term) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | Let _0 -> _0
let uu___is_Labeled: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | Labeled _0 -> true | uu____646 -> false
let __proj__Labeled__item___0:
  term' ->
    (term,Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple3
  = fun projectee  -> match projectee with | Labeled _0 -> _0
let uu___is_LblPos: term' -> Prims.bool =
  fun projectee  ->
    match projectee with | LblPos _0 -> true | uu____680 -> false
let __proj__LblPos__item___0:
  term' -> (term,Prims.string) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | LblPos _0 -> _0
let __proj__Mkterm__item__tm: term -> term' =
  fun projectee  ->
    match projectee with
    | { tm = __fname__tm; freevars = __fname__freevars; rng = __fname__rng;_}
        -> __fname__tm
let __proj__Mkterm__item__freevars:
  term ->
    (Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list
      FStar_Syntax_Syntax.memo
  =
  fun projectee  ->
    match projectee with
    | { tm = __fname__tm; freevars = __fname__freevars; rng = __fname__rng;_}
        -> __fname__freevars
let __proj__Mkterm__item__rng: term -> FStar_Range.range =
  fun projectee  ->
    match projectee with
    | { tm = __fname__tm; freevars = __fname__freevars; rng = __fname__rng;_}
        -> __fname__rng
type pat = term[@@deriving show]
type fv = (Prims.string,sort) FStar_Pervasives_Native.tuple2[@@deriving show]
type fvs = (Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list
[@@deriving show]
type caption = Prims.string FStar_Pervasives_Native.option[@@deriving show]
type binders = (Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list
[@@deriving show]
type constructor_field =
  (Prims.string,sort,Prims.bool) FStar_Pervasives_Native.tuple3[@@deriving
                                                                 show]
type constructor_t =
  (Prims.string,constructor_field Prims.list,sort,Prims.int,Prims.bool)
    FStar_Pervasives_Native.tuple5[@@deriving show]
type constructors = constructor_t Prims.list[@@deriving show]
type fact_db_id =
  | Name of FStar_Ident.lid
  | Namespace of FStar_Ident.lid
  | Tag of Prims.string[@@deriving show]
let uu___is_Name: fact_db_id -> Prims.bool =
  fun projectee  ->
    match projectee with | Name _0 -> true | uu____833 -> false
let __proj__Name__item___0: fact_db_id -> FStar_Ident.lid =
  fun projectee  -> match projectee with | Name _0 -> _0
let uu___is_Namespace: fact_db_id -> Prims.bool =
  fun projectee  ->
    match projectee with | Namespace _0 -> true | uu____845 -> false
let __proj__Namespace__item___0: fact_db_id -> FStar_Ident.lid =
  fun projectee  -> match projectee with | Namespace _0 -> _0
let uu___is_Tag: fact_db_id -> Prims.bool =
  fun projectee  ->
    match projectee with | Tag _0 -> true | uu____857 -> false
let __proj__Tag__item___0: fact_db_id -> Prims.string =
  fun projectee  -> match projectee with | Tag _0 -> _0
type assumption =
  {
  assumption_term: term;
  assumption_caption: caption;
  assumption_name: Prims.string;
  assumption_fact_ids: fact_db_id Prims.list;}[@@deriving show]
let __proj__Mkassumption__item__assumption_term: assumption -> term =
  fun projectee  ->
    match projectee with
    | { assumption_term = __fname__assumption_term;
        assumption_caption = __fname__assumption_caption;
        assumption_name = __fname__assumption_name;
        assumption_fact_ids = __fname__assumption_fact_ids;_} ->
        __fname__assumption_term
let __proj__Mkassumption__item__assumption_caption: assumption -> caption =
  fun projectee  ->
    match projectee with
    | { assumption_term = __fname__assumption_term;
        assumption_caption = __fname__assumption_caption;
        assumption_name = __fname__assumption_name;
        assumption_fact_ids = __fname__assumption_fact_ids;_} ->
        __fname__assumption_caption
let __proj__Mkassumption__item__assumption_name: assumption -> Prims.string =
  fun projectee  ->
    match projectee with
    | { assumption_term = __fname__assumption_term;
        assumption_caption = __fname__assumption_caption;
        assumption_name = __fname__assumption_name;
        assumption_fact_ids = __fname__assumption_fact_ids;_} ->
        __fname__assumption_name
let __proj__Mkassumption__item__assumption_fact_ids:
  assumption -> fact_db_id Prims.list =
  fun projectee  ->
    match projectee with
    | { assumption_term = __fname__assumption_term;
        assumption_caption = __fname__assumption_caption;
        assumption_name = __fname__assumption_name;
        assumption_fact_ids = __fname__assumption_fact_ids;_} ->
        __fname__assumption_fact_ids
type decl =
  | DefPrelude
  | DeclFun of (Prims.string,sort Prims.list,sort,caption)
  FStar_Pervasives_Native.tuple4
  | DefineFun of (Prims.string,sort Prims.list,sort,term,caption)
  FStar_Pervasives_Native.tuple5
  | Assume of assumption
  | Caption of Prims.string
  | Eval of term
  | Echo of Prims.string
  | RetainAssumptions of Prims.string Prims.list
  | Push
  | Pop
  | CheckSat
  | GetUnsatCore
  | SetOption of (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2
  | GetStatistics
  | GetReasonUnknown[@@deriving show]
let uu___is_DefPrelude: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | DefPrelude  -> true | uu____986 -> false
let uu___is_DeclFun: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | DeclFun _0 -> true | uu____1001 -> false
let __proj__DeclFun__item___0:
  decl ->
    (Prims.string,sort Prims.list,sort,caption)
      FStar_Pervasives_Native.tuple4
  = fun projectee  -> match projectee with | DeclFun _0 -> _0
let uu___is_DefineFun: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | DefineFun _0 -> true | uu____1055 -> false
let __proj__DefineFun__item___0:
  decl ->
    (Prims.string,sort Prims.list,sort,term,caption)
      FStar_Pervasives_Native.tuple5
  = fun projectee  -> match projectee with | DefineFun _0 -> _0
let uu___is_Assume: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Assume _0 -> true | uu____1103 -> false
let __proj__Assume__item___0: decl -> assumption =
  fun projectee  -> match projectee with | Assume _0 -> _0
let uu___is_Caption: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Caption _0 -> true | uu____1115 -> false
let __proj__Caption__item___0: decl -> Prims.string =
  fun projectee  -> match projectee with | Caption _0 -> _0
let uu___is_Eval: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Eval _0 -> true | uu____1127 -> false
let __proj__Eval__item___0: decl -> term =
  fun projectee  -> match projectee with | Eval _0 -> _0
let uu___is_Echo: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Echo _0 -> true | uu____1139 -> false
let __proj__Echo__item___0: decl -> Prims.string =
  fun projectee  -> match projectee with | Echo _0 -> _0
let uu___is_RetainAssumptions: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | RetainAssumptions _0 -> true | uu____1153 -> false
let __proj__RetainAssumptions__item___0: decl -> Prims.string Prims.list =
  fun projectee  -> match projectee with | RetainAssumptions _0 -> _0
let uu___is_Push: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | Push  -> true | uu____1170 -> false
let uu___is_Pop: decl -> Prims.bool =
  fun projectee  -> match projectee with | Pop  -> true | uu____1174 -> false
let uu___is_CheckSat: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | CheckSat  -> true | uu____1178 -> false
let uu___is_GetUnsatCore: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | GetUnsatCore  -> true | uu____1182 -> false
let uu___is_SetOption: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | SetOption _0 -> true | uu____1191 -> false
let __proj__SetOption__item___0:
  decl -> (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2 =
  fun projectee  -> match projectee with | SetOption _0 -> _0
let uu___is_GetStatistics: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | GetStatistics  -> true | uu____1214 -> false
let uu___is_GetReasonUnknown: decl -> Prims.bool =
  fun projectee  ->
    match projectee with | GetReasonUnknown  -> true | uu____1218 -> false
type decls_t = decl Prims.list[@@deriving show]
type error_label =
  (fv,Prims.string,FStar_Range.range) FStar_Pervasives_Native.tuple3[@@deriving
                                                                    show]
type error_labels = error_label Prims.list[@@deriving show]
let fv_eq: fv -> fv -> Prims.bool =
  fun x  ->
    fun y  ->
      (FStar_Pervasives_Native.fst x) = (FStar_Pervasives_Native.fst y)
let fv_sort:
  'Auu____1238 'Auu____1239 .
    ('Auu____1239,'Auu____1238) FStar_Pervasives_Native.tuple2 ->
      'Auu____1238
  = fun x  -> FStar_Pervasives_Native.snd x
let freevar_eq: term -> term -> Prims.bool =
  fun x  ->
    fun y  ->
      match ((x.tm), (y.tm)) with
      | (FreeV x1,FreeV y1) -> fv_eq x1 y1
      | uu____1268 -> false
let freevar_sort: term -> sort =
  fun uu___69_1275  ->
    match uu___69_1275 with
    | { tm = FreeV x; freevars = uu____1277; rng = uu____1278;_} -> fv_sort x
    | uu____1291 -> failwith "impossible"
let fv_of_term: term -> fv =
  fun uu___70_1294  ->
    match uu___70_1294 with
    | { tm = FreeV fv; freevars = uu____1296; rng = uu____1297;_} -> fv
    | uu____1310 -> failwith "impossible"
let rec freevars:
  term -> (Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list =
  fun t  ->
    match t.tm with
    | Integer uu____1326 -> []
    | BoundV uu____1331 -> []
    | FreeV fv -> [fv]
    | App (uu____1349,tms) -> FStar_List.collect freevars tms
    | Quant (uu____1359,uu____1360,uu____1361,uu____1362,t1) -> freevars t1
    | Labeled (t1,uu____1381,uu____1382) -> freevars t1
    | LblPos (t1,uu____1384) -> freevars t1
    | Let (es,body) -> FStar_List.collect freevars (body :: es)
let free_variables: term -> fvs =
  fun t  ->
    let uu____1398 = FStar_ST.op_Bang t.freevars in
    match uu____1398 with
    | FStar_Pervasives_Native.Some b -> b
    | FStar_Pervasives_Native.None  ->
        let fvs =
          let uu____1491 = freevars t in
          FStar_Util.remove_dups fv_eq uu____1491 in
        (FStar_ST.op_Colon_Equals t.freevars
           (FStar_Pervasives_Native.Some fvs);
         fvs)
let qop_to_string: qop -> Prims.string =
  fun uu___71_1561  ->
    match uu___71_1561 with | Forall  -> "forall" | Exists  -> "exists"
let op_to_string: op -> Prims.string =
  fun uu___72_1564  ->
    match uu___72_1564 with
    | TrueOp  -> "true"
    | FalseOp  -> "false"
    | Not  -> "not"
    | And  -> "and"
    | Or  -> "or"
    | Imp  -> "implies"
    | Iff  -> "iff"
    | Eq  -> "="
    | LT  -> "<"
    | LTE  -> "<="
    | GT  -> ">"
    | GTE  -> ">="
    | Add  -> "+"
    | Sub  -> "-"
    | Div  -> "div"
    | Mul  -> "*"
    | Minus  -> "-"
    | Mod  -> "mod"
    | ITE  -> "ite"
    | BvAnd  -> "bvand"
    | BvXor  -> "bvxor"
    | BvOr  -> "bvor"
    | BvAdd  -> "bvadd"
    | BvSub  -> "bvsub"
    | BvShl  -> "bvshl"
    | BvShr  -> "bvlshr"
    | BvUdiv  -> "bvudiv"
    | BvMod  -> "bvurem"
    | BvMul  -> "bvmul"
    | BvUlt  -> "bvult"
    | BvToNat  -> "bv2int"
    | BvUext n1 ->
        let uu____1566 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "(_ zero_extend %s)" uu____1566
    | NatToBv n1 ->
        let uu____1568 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "(_ int2bv %s)" uu____1568
    | Var s -> s
let weightToSmt: Prims.int FStar_Pervasives_Native.option -> Prims.string =
  fun uu___73_1574  ->
    match uu___73_1574 with
    | FStar_Pervasives_Native.None  -> ""
    | FStar_Pervasives_Native.Some i ->
        let uu____1578 = FStar_Util.string_of_int i in
        FStar_Util.format1 ":weight %s\n" uu____1578
let rec hash_of_term': term' -> Prims.string =
  fun t  ->
    match t with
    | Integer i -> i
    | BoundV i ->
        let uu____1586 = FStar_Util.string_of_int i in
        Prims.strcat "@" uu____1586
    | FreeV x ->
        let uu____1592 =
          let uu____1593 = strSort (FStar_Pervasives_Native.snd x) in
          Prims.strcat ":" uu____1593 in
        Prims.strcat (FStar_Pervasives_Native.fst x) uu____1592
    | App (op,tms) ->
        let uu____1600 =
          let uu____1601 = op_to_string op in
          let uu____1602 =
            let uu____1603 =
              let uu____1604 = FStar_List.map hash_of_term tms in
              FStar_All.pipe_right uu____1604 (FStar_String.concat " ") in
            Prims.strcat uu____1603 ")" in
          Prims.strcat uu____1601 uu____1602 in
        Prims.strcat "(" uu____1600
    | Labeled (t1,r1,r2) ->
        let uu____1612 = hash_of_term t1 in
        let uu____1613 =
          let uu____1614 = FStar_Range.string_of_range r2 in
          Prims.strcat r1 uu____1614 in
        Prims.strcat uu____1612 uu____1613
    | LblPos (t1,r) ->
        let uu____1617 =
          let uu____1618 = hash_of_term t1 in
          Prims.strcat uu____1618
            (Prims.strcat " :lblpos " (Prims.strcat r ")")) in
        Prims.strcat "(! " uu____1617
    | Quant (qop,pats,wopt,sorts,body) ->
        let uu____1640 =
          let uu____1641 =
            let uu____1642 =
              let uu____1643 =
                let uu____1644 = FStar_List.map strSort sorts in
                FStar_All.pipe_right uu____1644 (FStar_String.concat " ") in
              let uu____1649 =
                let uu____1650 =
                  let uu____1651 = hash_of_term body in
                  let uu____1652 =
                    let uu____1653 =
                      let uu____1654 = weightToSmt wopt in
                      let uu____1655 =
                        let uu____1656 =
                          let uu____1657 =
                            let uu____1658 =
                              FStar_All.pipe_right pats
                                (FStar_List.map
                                   (fun pats1  ->
                                      let uu____1674 =
                                        FStar_List.map hash_of_term pats1 in
                                      FStar_All.pipe_right uu____1674
                                        (FStar_String.concat " "))) in
                            FStar_All.pipe_right uu____1658
                              (FStar_String.concat "; ") in
                          Prims.strcat uu____1657 "))" in
                        Prims.strcat " " uu____1656 in
                      Prims.strcat uu____1654 uu____1655 in
                    Prims.strcat " " uu____1653 in
                  Prims.strcat uu____1651 uu____1652 in
                Prims.strcat ")(! " uu____1650 in
              Prims.strcat uu____1643 uu____1649 in
            Prims.strcat " (" uu____1642 in
          Prims.strcat (qop_to_string qop) uu____1641 in
        Prims.strcat "(" uu____1640
    | Let (es,body) ->
        let uu____1687 =
          let uu____1688 =
            let uu____1689 = FStar_List.map hash_of_term es in
            FStar_All.pipe_right uu____1689 (FStar_String.concat " ") in
          let uu____1694 =
            let uu____1695 =
              let uu____1696 = hash_of_term body in
              Prims.strcat uu____1696 ")" in
            Prims.strcat ") " uu____1695 in
          Prims.strcat uu____1688 uu____1694 in
        Prims.strcat "(let (" uu____1687
and hash_of_term: term -> Prims.string = fun tm  -> hash_of_term' tm.tm
let mkBoxFunctions:
  Prims.string -> (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2
  = fun s  -> (s, (Prims.strcat s "_proj_0"))
let boxIntFun: (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2 =
  mkBoxFunctions "BoxInt"
let boxBoolFun: (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2 =
  mkBoxFunctions "BoxBool"
let boxStringFun: (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2
  = mkBoxFunctions "BoxString"
let boxBitVecFun:
  Prims.int -> (Prims.string,Prims.string) FStar_Pervasives_Native.tuple2 =
  fun sz  ->
    let uu____1724 =
      let uu____1725 = FStar_Util.string_of_int sz in
      Prims.strcat "BoxBitVec" uu____1725 in
    mkBoxFunctions uu____1724
let isInjective: Prims.string -> Prims.bool =
  fun s  ->
    if (FStar_String.length s) >= (Prims.parse_int "3")
    then
      (let uu____1731 =
         FStar_String.substring s (Prims.parse_int "0") (Prims.parse_int "3") in
       uu____1731 = "Box") &&
        (let uu____1733 =
           let uu____1734 = FStar_String.list_of_string s in
           FStar_List.existsML (fun c  -> c = 46) uu____1734 in
         Prims.op_Negation uu____1733)
    else false
let mk: term' -> FStar_Range.range -> term =
  fun t  ->
    fun r  ->
      let uu____1751 = FStar_Util.mk_ref FStar_Pervasives_Native.None in
      { tm = t; freevars = uu____1751; rng = r }
let mkTrue: FStar_Range.range -> term = fun r  -> mk (App (TrueOp, [])) r
let mkFalse: FStar_Range.range -> term = fun r  -> mk (App (FalseOp, [])) r
let mkInteger: Prims.string -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let uu____1804 =
        let uu____1805 = FStar_Util.ensure_decimal i in Integer uu____1805 in
      mk uu____1804 r
let mkInteger': Prims.int -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let uu____1812 = FStar_Util.string_of_int i in mkInteger uu____1812 r
let mkBoundV: Prims.int -> FStar_Range.range -> term =
  fun i  -> fun r  -> mk (BoundV i) r
let mkFreeV:
  (Prims.string,sort) FStar_Pervasives_Native.tuple2 ->
    FStar_Range.range -> term
  = fun x  -> fun r  -> mk (FreeV x) r
let mkApp':
  (op,term Prims.list) FStar_Pervasives_Native.tuple2 ->
    FStar_Range.range -> term
  = fun f  -> fun r  -> mk (App f) r
let mkApp:
  (Prims.string,term Prims.list) FStar_Pervasives_Native.tuple2 ->
    FStar_Range.range -> term
  =
  fun uu____1861  ->
    fun r  -> match uu____1861 with | (s,args) -> mk (App ((Var s), args)) r
let mkNot: term -> FStar_Range.range -> term =
  fun t  ->
    fun r  ->
      match t.tm with
      | App (TrueOp ,uu____1883) -> mkFalse r
      | App (FalseOp ,uu____1888) -> mkTrue r
      | uu____1893 -> mkApp' (Not, [t]) r
let mkAnd:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  fun uu____1904  ->
    fun r  ->
      match uu____1904 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (TrueOp ,uu____1912),uu____1913) -> t2
           | (uu____1918,App (TrueOp ,uu____1919)) -> t1
           | (App (FalseOp ,uu____1924),uu____1925) -> mkFalse r
           | (uu____1930,App (FalseOp ,uu____1931)) -> mkFalse r
           | (App (And ,ts1),App (And ,ts2)) ->
               mkApp' (And, (FStar_List.append ts1 ts2)) r
           | (uu____1948,App (And ,ts2)) -> mkApp' (And, (t1 :: ts2)) r
           | (App (And ,ts1),uu____1957) ->
               mkApp' (And, (FStar_List.append ts1 [t2])) r
           | uu____1964 -> mkApp' (And, [t1; t2]) r)
let mkOr:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  fun uu____1979  ->
    fun r  ->
      match uu____1979 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (TrueOp ,uu____1987),uu____1988) -> mkTrue r
           | (uu____1993,App (TrueOp ,uu____1994)) -> mkTrue r
           | (App (FalseOp ,uu____1999),uu____2000) -> t2
           | (uu____2005,App (FalseOp ,uu____2006)) -> t1
           | (App (Or ,ts1),App (Or ,ts2)) ->
               mkApp' (Or, (FStar_List.append ts1 ts2)) r
           | (uu____2023,App (Or ,ts2)) -> mkApp' (Or, (t1 :: ts2)) r
           | (App (Or ,ts1),uu____2032) ->
               mkApp' (Or, (FStar_List.append ts1 [t2])) r
           | uu____2039 -> mkApp' (Or, [t1; t2]) r)
let mkImp:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  fun uu____2054  ->
    fun r  ->
      match uu____2054 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (uu____2062,App (TrueOp ,uu____2063)) -> mkTrue r
           | (App (FalseOp ,uu____2068),uu____2069) -> mkTrue r
           | (App (TrueOp ,uu____2074),uu____2075) -> t2
           | (uu____2080,App (Imp ,t1'::t2'::[])) ->
               let uu____2085 =
                 let uu____2092 =
                   let uu____2095 = mkAnd (t1, t1') r in [uu____2095; t2'] in
                 (Imp, uu____2092) in
               mkApp' uu____2085 r
           | uu____2098 -> mkApp' (Imp, [t1; t2]) r)
let mk_bin_op:
  op ->
    (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun op  ->
    fun uu____2116  ->
      fun r  -> match uu____2116 with | (t1,t2) -> mkApp' (op, [t1; t2]) r
let mkMinus: term -> FStar_Range.range -> term =
  fun t  -> fun r  -> mkApp' (Minus, [t]) r
let mkNatToBv: Prims.int -> term -> FStar_Range.range -> term =
  fun sz  -> fun t  -> fun r  -> mkApp' ((NatToBv sz), [t]) r
let mkBvUext: Prims.int -> term -> FStar_Range.range -> term =
  fun sz  -> fun t  -> fun r  -> mkApp' ((BvUext sz), [t]) r
let mkBvToNat: term -> FStar_Range.range -> term =
  fun t  -> fun r  -> mkApp' (BvToNat, [t]) r
let mkBvAnd:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op BvAnd
let mkBvXor:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op BvXor
let mkBvOr:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op BvOr
let mkBvAdd:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op BvAdd
let mkBvSub:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op BvSub
let mkBvShl:
  Prims.int ->
    (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun sz  ->
    fun uu____2215  ->
      fun r  ->
        match uu____2215 with
        | (t1,t2) ->
            let uu____2223 =
              let uu____2230 =
                let uu____2233 =
                  let uu____2236 = mkNatToBv sz t2 r in [uu____2236] in
                t1 :: uu____2233 in
              (BvShl, uu____2230) in
            mkApp' uu____2223 r
let mkBvShr:
  Prims.int ->
    (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun sz  ->
    fun uu____2250  ->
      fun r  ->
        match uu____2250 with
        | (t1,t2) ->
            let uu____2258 =
              let uu____2265 =
                let uu____2268 =
                  let uu____2271 = mkNatToBv sz t2 r in [uu____2271] in
                t1 :: uu____2268 in
              (BvShr, uu____2265) in
            mkApp' uu____2258 r
let mkBvUdiv:
  Prims.int ->
    (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun sz  ->
    fun uu____2285  ->
      fun r  ->
        match uu____2285 with
        | (t1,t2) ->
            let uu____2293 =
              let uu____2300 =
                let uu____2303 =
                  let uu____2306 = mkNatToBv sz t2 r in [uu____2306] in
                t1 :: uu____2303 in
              (BvUdiv, uu____2300) in
            mkApp' uu____2293 r
let mkBvMod:
  Prims.int ->
    (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun sz  ->
    fun uu____2320  ->
      fun r  ->
        match uu____2320 with
        | (t1,t2) ->
            let uu____2328 =
              let uu____2335 =
                let uu____2338 =
                  let uu____2341 = mkNatToBv sz t2 r in [uu____2341] in
                t1 :: uu____2338 in
              (BvMod, uu____2335) in
            mkApp' uu____2328 r
let mkBvMul:
  Prims.int ->
    (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun sz  ->
    fun uu____2355  ->
      fun r  ->
        match uu____2355 with
        | (t1,t2) ->
            let uu____2363 =
              let uu____2370 =
                let uu____2373 =
                  let uu____2376 = mkNatToBv sz t2 r in [uu____2376] in
                t1 :: uu____2373 in
              (BvMul, uu____2370) in
            mkApp' uu____2363 r
let mkBvUlt:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op BvUlt
let mkIff:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op Iff
let mkEq:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  fun uu____2403  ->
    fun r  ->
      match uu____2403 with
      | (t1,t2) ->
          (match ((t1.tm), (t2.tm)) with
           | (App (Var f1,s1::[]),App (Var f2,s2::[])) when
               (f1 = f2) && (isInjective f1) -> mk_bin_op Eq (s1, s2) r
           | uu____2419 -> mk_bin_op Eq (t1, t2) r)
let mkLT:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op LT
let mkLTE:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op LTE
let mkGT:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op GT
let mkGTE:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op GTE
let mkAdd:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op Add
let mkSub:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op Sub
let mkDiv:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op Div
let mkMul:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op Mul
let mkMod:
  (term,term) FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term =
  mk_bin_op Mod
let mkITE:
  (term,term,term) FStar_Pervasives_Native.tuple3 ->
    FStar_Range.range -> term
  =
  fun uu____2506  ->
    fun r  ->
      match uu____2506 with
      | (t1,t2,t3) ->
          (match t1.tm with
           | App (TrueOp ,uu____2517) -> t2
           | App (FalseOp ,uu____2522) -> t3
           | uu____2527 ->
               (match ((t2.tm), (t3.tm)) with
                | (App (TrueOp ,uu____2528),App (TrueOp ,uu____2529)) ->
                    mkTrue r
                | (App (TrueOp ,uu____2538),uu____2539) ->
                    let uu____2544 =
                      let uu____2549 = mkNot t1 t1.rng in (uu____2549, t3) in
                    mkImp uu____2544 r
                | (uu____2550,App (TrueOp ,uu____2551)) -> mkImp (t1, t2) r
                | (uu____2556,uu____2557) -> mkApp' (ITE, [t1; t2; t3]) r))
let mkCases: term Prims.list -> FStar_Range.range -> term =
  fun t  ->
    fun r  ->
      match t with
      | [] -> failwith "Impos"
      | hd1::tl1 ->
          FStar_List.fold_left (fun out  -> fun t1  -> mkAnd (out, t1) r) hd1
            tl1
let mkQuant:
  (qop,term Prims.list Prims.list,Prims.int FStar_Pervasives_Native.option,
    sort Prims.list,term) FStar_Pervasives_Native.tuple5 ->
    FStar_Range.range -> term
  =
  fun uu____2600  ->
    fun r  ->
      match uu____2600 with
      | (qop,pats,wopt,vars,body) ->
          if (FStar_List.length vars) = (Prims.parse_int "0")
          then body
          else
            (match body.tm with
             | App (TrueOp ,uu____2642) -> body
             | uu____2647 -> mk (Quant (qop, pats, wopt, vars, body)) r)
let mkLet:
  (term Prims.list,term) FStar_Pervasives_Native.tuple2 ->
    FStar_Range.range -> term
  =
  fun uu____2666  ->
    fun r  ->
      match uu____2666 with
      | (es,body) ->
          if (FStar_List.length es) = (Prims.parse_int "0")
          then body
          else mk (Let (es, body)) r
let abstr: fv Prims.list -> term -> term =
  fun fvs  ->
    fun t  ->
      let nvars = FStar_List.length fvs in
      let index_of fv =
        let uu____2700 = FStar_Util.try_find_index (fv_eq fv) fvs in
        match uu____2700 with
        | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
        | FStar_Pervasives_Native.Some i ->
            FStar_Pervasives_Native.Some
              (nvars - (i + (Prims.parse_int "1"))) in
      let rec aux ix t1 =
        let uu____2719 = FStar_ST.op_Bang t1.freevars in
        match uu____2719 with
        | FStar_Pervasives_Native.Some [] -> t1
        | uu____2800 ->
            (match t1.tm with
             | Integer uu____2809 -> t1
             | BoundV uu____2810 -> t1
             | FreeV x ->
                 let uu____2816 = index_of x in
                 (match uu____2816 with
                  | FStar_Pervasives_Native.None  -> t1
                  | FStar_Pervasives_Native.Some i ->
                      mkBoundV (i + ix) t1.rng)
             | App (op,tms) ->
                 let uu____2826 =
                   let uu____2833 = FStar_List.map (aux ix) tms in
                   (op, uu____2833) in
                 mkApp' uu____2826 t1.rng
             | Labeled (t2,r1,r2) ->
                 let uu____2841 =
                   let uu____2842 =
                     let uu____2849 = aux ix t2 in (uu____2849, r1, r2) in
                   Labeled uu____2842 in
                 mk uu____2841 t2.rng
             | LblPos (t2,r) ->
                 let uu____2852 =
                   let uu____2853 =
                     let uu____2858 = aux ix t2 in (uu____2858, r) in
                   LblPos uu____2853 in
                 mk uu____2852 t2.rng
             | Quant (qop,pats,wopt,vars,body) ->
                 let n1 = FStar_List.length vars in
                 let uu____2881 =
                   let uu____2900 =
                     FStar_All.pipe_right pats
                       (FStar_List.map (FStar_List.map (aux (ix + n1)))) in
                   let uu____2921 = aux (ix + n1) body in
                   (qop, uu____2900, wopt, vars, uu____2921) in
                 mkQuant uu____2881 t1.rng
             | Let (es,body) ->
                 let uu____2940 =
                   FStar_List.fold_left
                     (fun uu____2958  ->
                        fun e  ->
                          match uu____2958 with
                          | (ix1,l) ->
                              let uu____2978 =
                                let uu____2981 = aux ix1 e in uu____2981 :: l in
                              ((ix1 + (Prims.parse_int "1")), uu____2978))
                     (ix, []) es in
                 (match uu____2940 with
                  | (ix1,es_rev) ->
                      let uu____2992 =
                        let uu____2999 = aux ix1 body in
                        ((FStar_List.rev es_rev), uu____2999) in
                      mkLet uu____2992 t1.rng)) in
      aux (Prims.parse_int "0") t
let inst: term Prims.list -> term -> term =
  fun tms  ->
    fun t  ->
      let tms1 = FStar_List.rev tms in
      let n1 = FStar_List.length tms1 in
      let rec aux shift t1 =
        match t1.tm with
        | Integer uu____3023 -> t1
        | FreeV uu____3024 -> t1
        | BoundV i ->
            if ((Prims.parse_int "0") <= (i - shift)) && ((i - shift) < n1)
            then FStar_List.nth tms1 (i - shift)
            else t1
        | App (op,tms2) ->
            let uu____3041 =
              let uu____3048 = FStar_List.map (aux shift) tms2 in
              (op, uu____3048) in
            mkApp' uu____3041 t1.rng
        | Labeled (t2,r1,r2) ->
            let uu____3056 =
              let uu____3057 =
                let uu____3064 = aux shift t2 in (uu____3064, r1, r2) in
              Labeled uu____3057 in
            mk uu____3056 t2.rng
        | LblPos (t2,r) ->
            let uu____3067 =
              let uu____3068 =
                let uu____3073 = aux shift t2 in (uu____3073, r) in
              LblPos uu____3068 in
            mk uu____3067 t2.rng
        | Quant (qop,pats,wopt,vars,body) ->
            let m = FStar_List.length vars in
            let shift1 = shift + m in
            let uu____3101 =
              let uu____3120 =
                FStar_All.pipe_right pats
                  (FStar_List.map (FStar_List.map (aux shift1))) in
              let uu____3137 = aux shift1 body in
              (qop, uu____3120, wopt, vars, uu____3137) in
            mkQuant uu____3101 t1.rng
        | Let (es,body) ->
            let uu____3152 =
              FStar_List.fold_left
                (fun uu____3170  ->
                   fun e  ->
                     match uu____3170 with
                     | (ix,es1) ->
                         let uu____3190 =
                           let uu____3193 = aux shift e in uu____3193 :: es1 in
                         ((shift + (Prims.parse_int "1")), uu____3190))
                (shift, []) es in
            (match uu____3152 with
             | (shift1,es_rev) ->
                 let uu____3204 =
                   let uu____3211 = aux shift1 body in
                   ((FStar_List.rev es_rev), uu____3211) in
                 mkLet uu____3204 t1.rng) in
      aux (Prims.parse_int "0") t
let subst: term -> fv -> term -> term =
  fun t  ->
    fun fv  -> fun s  -> let uu____3223 = abstr [fv] t in inst [s] uu____3223
let mkQuant':
  (qop,term Prims.list Prims.list,Prims.int FStar_Pervasives_Native.option,
    fv Prims.list,term) FStar_Pervasives_Native.tuple5 ->
    FStar_Range.range -> term
  =
  fun uu____3246  ->
    match uu____3246 with
    | (qop,pats,wopt,vars,body) ->
        let uu____3288 =
          let uu____3307 =
            FStar_All.pipe_right pats
              (FStar_List.map (FStar_List.map (abstr vars))) in
          let uu____3324 = FStar_List.map fv_sort vars in
          let uu____3331 = abstr vars body in
          (qop, uu____3307, wopt, uu____3324, uu____3331) in
        mkQuant uu____3288
let mkForall'':
  (pat Prims.list Prims.list,Prims.int FStar_Pervasives_Native.option,
    sort Prims.list,term) FStar_Pervasives_Native.tuple4 ->
    FStar_Range.range -> term
  =
  fun uu____3360  ->
    fun r  ->
      match uu____3360 with
      | (pats,wopt,sorts,body) -> mkQuant (Forall, pats, wopt, sorts, body) r
let mkForall':
  (pat Prims.list Prims.list,Prims.int FStar_Pervasives_Native.option,
    fvs,term) FStar_Pervasives_Native.tuple4 -> FStar_Range.range -> term
  =
  fun uu____3424  ->
    fun r  ->
      match uu____3424 with
      | (pats,wopt,vars,body) ->
          let uu____3456 = mkQuant' (Forall, pats, wopt, vars, body) in
          uu____3456 r
let mkForall:
  (pat Prims.list Prims.list,fvs,term) FStar_Pervasives_Native.tuple3 ->
    FStar_Range.range -> term
  =
  fun uu____3479  ->
    fun r  ->
      match uu____3479 with
      | (pats,vars,body) ->
          let uu____3502 =
            mkQuant' (Forall, pats, FStar_Pervasives_Native.None, vars, body) in
          uu____3502 r
let mkExists:
  (pat Prims.list Prims.list,fvs,term) FStar_Pervasives_Native.tuple3 ->
    FStar_Range.range -> term
  =
  fun uu____3525  ->
    fun r  ->
      match uu____3525 with
      | (pats,vars,body) ->
          let uu____3548 =
            mkQuant' (Exists, pats, FStar_Pervasives_Native.None, vars, body) in
          uu____3548 r
let mkLet':
  ((fv,term) FStar_Pervasives_Native.tuple2 Prims.list,term)
    FStar_Pervasives_Native.tuple2 -> FStar_Range.range -> term
  =
  fun uu____3571  ->
    fun r  ->
      match uu____3571 with
      | (bindings,body) ->
          let uu____3597 = FStar_List.split bindings in
          (match uu____3597 with
           | (vars,es) ->
               let uu____3616 =
                 let uu____3623 = abstr vars body in (es, uu____3623) in
               mkLet uu____3616 r)
let norng: FStar_Range.range = FStar_Range.dummyRange
let mkDefineFun:
  (Prims.string,(Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list,
    sort,term,caption) FStar_Pervasives_Native.tuple5 -> decl
  =
  fun uu____3644  ->
    match uu____3644 with
    | (nm,vars,s,tm,c) ->
        let uu____3678 =
          let uu____3691 = FStar_List.map fv_sort vars in
          let uu____3698 = abstr vars tm in
          (nm, uu____3691, s, uu____3698, c) in
        DefineFun uu____3678
let constr_id_of_sort: sort -> Prims.string =
  fun sort  ->
    let uu____3704 = strSort sort in
    FStar_Util.format1 "%s_constr_id" uu____3704
let fresh_token:
  (Prims.string,sort) FStar_Pervasives_Native.tuple2 -> Prims.int -> decl =
  fun uu____3713  ->
    fun id1  ->
      match uu____3713 with
      | (tok_name,sort) ->
          let a_name = Prims.strcat "fresh_token_" tok_name in
          let a =
            let uu____3723 =
              let uu____3724 =
                let uu____3729 = mkInteger' id1 norng in
                let uu____3730 =
                  let uu____3731 =
                    let uu____3738 = constr_id_of_sort sort in
                    let uu____3739 =
                      let uu____3742 = mkApp (tok_name, []) norng in
                      [uu____3742] in
                    (uu____3738, uu____3739) in
                  mkApp uu____3731 norng in
                (uu____3729, uu____3730) in
              mkEq uu____3724 norng in
            {
              assumption_term = uu____3723;
              assumption_caption =
                (FStar_Pervasives_Native.Some "fresh token");
              assumption_name = a_name;
              assumption_fact_ids = []
            } in
          Assume a
let fresh_constructor:
  (Prims.string,sort Prims.list,sort,Prims.int)
    FStar_Pervasives_Native.tuple4 -> decl
  =
  fun uu____3759  ->
    match uu____3759 with
    | (name,arg_sorts,sort,id1) ->
        let id2 = FStar_Util.string_of_int id1 in
        let bvars =
          FStar_All.pipe_right arg_sorts
            (FStar_List.mapi
               (fun i  ->
                  fun s  ->
                    let uu____3791 =
                      let uu____3796 =
                        let uu____3797 = FStar_Util.string_of_int i in
                        Prims.strcat "x_" uu____3797 in
                      (uu____3796, s) in
                    mkFreeV uu____3791 norng)) in
        let bvar_names = FStar_List.map fv_of_term bvars in
        let capp = mkApp (name, bvars) norng in
        let cid_app =
          let uu____3805 =
            let uu____3812 = constr_id_of_sort sort in (uu____3812, [capp]) in
          mkApp uu____3805 norng in
        let a_name = Prims.strcat "constructor_distinct_" name in
        let a =
          let uu____3817 =
            let uu____3818 =
              let uu____3829 =
                let uu____3830 =
                  let uu____3835 = mkInteger id2 norng in
                  (uu____3835, cid_app) in
                mkEq uu____3830 norng in
              ([[capp]], bvar_names, uu____3829) in
            mkForall uu____3818 norng in
          {
            assumption_term = uu____3817;
            assumption_caption =
              (FStar_Pervasives_Native.Some "Consrtructor distinct");
            assumption_name = a_name;
            assumption_fact_ids = []
          } in
        Assume a
let injective_constructor:
  (Prims.string,constructor_field Prims.list,sort)
    FStar_Pervasives_Native.tuple3 -> decls_t
  =
  fun uu____3856  ->
    match uu____3856 with
    | (name,fields,sort) ->
        let n_bvars = FStar_List.length fields in
        let bvar_name i =
          let uu____3877 = FStar_Util.string_of_int i in
          Prims.strcat "x_" uu____3877 in
        let bvar_index i = n_bvars - (i + (Prims.parse_int "1")) in
        let bvar i s =
          let uu____3897 = let uu____3902 = bvar_name i in (uu____3902, s) in
          mkFreeV uu____3897 in
        let bvars =
          FStar_All.pipe_right fields
            (FStar_List.mapi
               (fun i  ->
                  fun uu____3923  ->
                    match uu____3923 with
                    | (uu____3930,s,uu____3932) ->
                        let uu____3933 = bvar i s in uu____3933 norng)) in
        let bvar_names = FStar_List.map fv_of_term bvars in
        let capp = mkApp (name, bvars) norng in
        let uu____3942 =
          FStar_All.pipe_right fields
            (FStar_List.mapi
               (fun i  ->
                  fun uu____3970  ->
                    match uu____3970 with
                    | (name1,s,projectible) ->
                        let cproj_app = mkApp (name1, [capp]) norng in
                        let proj_name =
                          DeclFun
                            (name1, [sort], s,
                              (FStar_Pervasives_Native.Some "Projector")) in
                        if projectible
                        then
                          let a =
                            let uu____3993 =
                              let uu____3994 =
                                let uu____4005 =
                                  let uu____4006 =
                                    let uu____4011 =
                                      let uu____4012 = bvar i s in
                                      uu____4012 norng in
                                    (cproj_app, uu____4011) in
                                  mkEq uu____4006 norng in
                                ([[capp]], bvar_names, uu____4005) in
                              mkForall uu____3994 norng in
                            {
                              assumption_term = uu____3993;
                              assumption_caption =
                                (FStar_Pervasives_Native.Some
                                   "Projection inverse");
                              assumption_name =
                                (Prims.strcat "projection_inverse_" name1);
                              assumption_fact_ids = []
                            } in
                          [proj_name; Assume a]
                        else [proj_name])) in
        FStar_All.pipe_right uu____3942 FStar_List.flatten
let constructor_to_decl: constructor_t -> decls_t =
  fun uu____4034  ->
    match uu____4034 with
    | (name,fields,sort,id1,injective) ->
        let injective1 = injective || true in
        let field_sorts =
          FStar_All.pipe_right fields
            (FStar_List.map
               (fun uu____4062  ->
                  match uu____4062 with
                  | (uu____4069,sort1,uu____4071) -> sort1)) in
        let cdecl =
          DeclFun
            (name, field_sorts, sort,
              (FStar_Pervasives_Native.Some "Constructor")) in
        let cid = fresh_constructor (name, field_sorts, sort, id1) in
        let disc =
          let disc_name = Prims.strcat "is-" name in
          let xfv = ("x", sort) in
          let xx = mkFreeV xfv norng in
          let disc_eq =
            let uu____4089 =
              let uu____4094 =
                let uu____4095 =
                  let uu____4102 = constr_id_of_sort sort in
                  (uu____4102, [xx]) in
                mkApp uu____4095 norng in
              let uu____4105 =
                let uu____4106 = FStar_Util.string_of_int id1 in
                mkInteger uu____4106 norng in
              (uu____4094, uu____4105) in
            mkEq uu____4089 norng in
          let uu____4107 =
            let uu____4122 =
              FStar_All.pipe_right fields
                (FStar_List.mapi
                   (fun i  ->
                      fun uu____4172  ->
                        match uu____4172 with
                        | (proj,s,projectible) ->
                            if projectible
                            then
                              let uu____4202 = mkApp (proj, [xx]) norng in
                              (uu____4202, [])
                            else
                              (let fi =
                                 let uu____4221 =
                                   let uu____4222 =
                                     FStar_Util.string_of_int i in
                                   Prims.strcat "f_" uu____4222 in
                                 (uu____4221, s) in
                               let uu____4223 = mkFreeV fi norng in
                               (uu____4223, [fi])))) in
            FStar_All.pipe_right uu____4122 FStar_List.split in
          match uu____4107 with
          | (proj_terms,ex_vars) ->
              let ex_vars1 = FStar_List.flatten ex_vars in
              let disc_inv_body =
                let uu____4304 =
                  let uu____4309 = mkApp (name, proj_terms) norng in
                  (xx, uu____4309) in
                mkEq uu____4304 norng in
              let disc_inv_body1 =
                match ex_vars1 with
                | [] -> disc_inv_body
                | uu____4317 -> mkExists ([], ex_vars1, disc_inv_body) norng in
              let disc_ax = mkAnd (disc_eq, disc_inv_body1) norng in
              let def =
                mkDefineFun
                  (disc_name, [xfv], Bool_sort, disc_ax,
                    (FStar_Pervasives_Native.Some "Discriminator definition")) in
              def in
        let projs =
          if injective1
          then injective_constructor (name, fields, sort)
          else [] in
        let uu____4358 =
          let uu____4361 =
            let uu____4362 = FStar_Util.format1 "<start constructor %s>" name in
            Caption uu____4362 in
          uu____4361 :: cdecl :: cid :: projs in
        let uu____4363 =
          let uu____4366 =
            let uu____4369 =
              let uu____4370 =
                FStar_Util.format1 "</end constructor %s>" name in
              Caption uu____4370 in
            [uu____4369] in
          FStar_List.append [disc] uu____4366 in
        FStar_List.append uu____4358 uu____4363
let name_binders_inner:
  Prims.string FStar_Pervasives_Native.option ->
    (Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list ->
      Prims.int ->
        sort Prims.list ->
          ((Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list,
            Prims.string Prims.list,Prims.int) FStar_Pervasives_Native.tuple3
  =
  fun prefix_opt  ->
    fun outer_names  ->
      fun start  ->
        fun sorts  ->
          let uu____4417 =
            FStar_All.pipe_right sorts
              (FStar_List.fold_left
                 (fun uu____4472  ->
                    fun s  ->
                      match uu____4472 with
                      | (names1,binders,n1) ->
                          let prefix1 =
                            match s with
                            | Term_sort  -> "@x"
                            | uu____4522 -> "@u" in
                          let prefix2 =
                            match prefix_opt with
                            | FStar_Pervasives_Native.None  -> prefix1
                            | FStar_Pervasives_Native.Some p ->
                                Prims.strcat p prefix1 in
                          let nm =
                            let uu____4526 = FStar_Util.string_of_int n1 in
                            Prims.strcat prefix2 uu____4526 in
                          let names2 = (nm, s) :: names1 in
                          let b =
                            let uu____4539 = strSort s in
                            FStar_Util.format2 "(%s %s)" nm uu____4539 in
                          (names2, (b :: binders),
                            (n1 + (Prims.parse_int "1"))))
                 (outer_names, [], start)) in
          match uu____4417 with
          | (names1,binders,n1) -> (names1, (FStar_List.rev binders), n1)
let name_macro_binders:
  sort Prims.list ->
    ((Prims.string,sort) FStar_Pervasives_Native.tuple2 Prims.list,Prims.string
                                                                    Prims.list)
      FStar_Pervasives_Native.tuple2
  =
  fun sorts  ->
    let uu____4616 =
      name_binders_inner (FStar_Pervasives_Native.Some "__") []
        (Prims.parse_int "0") sorts in
    match uu____4616 with
    | (names1,binders,n1) -> ((FStar_List.rev names1), binders)
let termToSmt: Prims.bool -> Prims.string -> term -> Prims.string =
  fun print_ranges  ->
    fun enclosing_name  ->
      fun t  ->
        let next_qid =
          let ctr = FStar_Util.mk_ref (Prims.parse_int "0") in
          fun depth  ->
            let n1 = FStar_ST.op_Bang ctr in
            FStar_Util.incr ctr;
            if n1 = (Prims.parse_int "0")
            then enclosing_name
            else
              (let uu____4778 = FStar_Util.string_of_int n1 in
               FStar_Util.format2 "%s.%s" enclosing_name uu____4778) in
        let remove_guard_free pats =
          FStar_All.pipe_right pats
            (FStar_List.map
               (fun ps  ->
                  FStar_All.pipe_right ps
                    (FStar_List.map
                       (fun tm  ->
                          match tm.tm with
                          | App
                              (Var
                               "Prims.guard_free",{ tm = BoundV uu____4820;
                                                    freevars = uu____4821;
                                                    rng = uu____4822;_}::[])
                              -> tm
                          | App (Var "Prims.guard_free",p::[]) -> p
                          | uu____4836 -> tm)))) in
        let rec aux' depth n1 names1 t1 =
          let aux1 = aux (depth + (Prims.parse_int "1")) in
          match t1.tm with
          | Integer i -> i
          | BoundV i ->
              let uu____4876 = FStar_List.nth names1 i in
              FStar_All.pipe_right uu____4876 FStar_Pervasives_Native.fst
          | FreeV x -> FStar_Pervasives_Native.fst x
          | App (op,[]) -> op_to_string op
          | App (op,tms) ->
              let uu____4891 = op_to_string op in
              let uu____4892 =
                let uu____4893 = FStar_List.map (aux1 n1 names1) tms in
                FStar_All.pipe_right uu____4893 (FStar_String.concat "\n") in
              FStar_Util.format2 "(%s %s)" uu____4891 uu____4892
          | Labeled (t2,uu____4899,uu____4900) -> aux1 n1 names1 t2
          | LblPos (t2,s) ->
              let uu____4903 = aux1 n1 names1 t2 in
              FStar_Util.format2 "(! %s :lblpos %s)" uu____4903 s
          | Quant (qop,pats,wopt,sorts,body) ->
              let qid = next_qid () in
              let uu____4926 =
                name_binders_inner FStar_Pervasives_Native.None names1 n1
                  sorts in
              (match uu____4926 with
               | (names2,binders,n2) ->
                   let binders1 =
                     FStar_All.pipe_right binders (FStar_String.concat " ") in
                   let pats1 = remove_guard_free pats in
                   let pats_str =
                     match pats1 with
                     | []::[] -> ";;no pats"
                     | [] -> ";;no pats"
                     | uu____4975 ->
                         let uu____4980 =
                           FStar_All.pipe_right pats1
                             (FStar_List.map
                                (fun pats2  ->
                                   let uu____4996 =
                                     let uu____4997 =
                                       FStar_List.map
                                         (fun p  ->
                                            let uu____5003 = aux1 n2 names2 p in
                                            FStar_Util.format1 "%s"
                                              uu____5003) pats2 in
                                     FStar_String.concat " " uu____4997 in
                                   FStar_Util.format1 "\n:pattern (%s)"
                                     uu____4996)) in
                         FStar_All.pipe_right uu____4980
                           (FStar_String.concat "\n") in
                   let uu____5006 =
                     let uu____5009 =
                       let uu____5012 =
                         let uu____5015 = aux1 n2 names2 body in
                         let uu____5016 =
                           let uu____5019 = weightToSmt wopt in
                           [uu____5019; pats_str; qid] in
                         uu____5015 :: uu____5016 in
                       binders1 :: uu____5012 in
                     (qop_to_string qop) :: uu____5009 in
                   FStar_Util.format "(%s (%s)\n (! %s\n %s\n%s\n:qid %s))"
                     uu____5006)
          | Let (es,body) ->
              let uu____5026 =
                FStar_List.fold_left
                  (fun uu____5063  ->
                     fun e  ->
                       match uu____5063 with
                       | (names0,binders,n0) ->
                           let nm =
                             let uu____5113 = FStar_Util.string_of_int n0 in
                             Prims.strcat "@lb" uu____5113 in
                           let names01 = (nm, Term_sort) :: names0 in
                           let b =
                             let uu____5126 = aux1 n1 names1 e in
                             FStar_Util.format2 "(%s %s)" nm uu____5126 in
                           (names01, (b :: binders),
                             (n0 + (Prims.parse_int "1")))) (names1, [], n1)
                  es in
              (match uu____5026 with
               | (names2,binders,n2) ->
                   let uu____5158 = aux1 n2 names2 body in
                   FStar_Util.format2 "(let (%s)\n%s)"
                     (FStar_String.concat " " binders) uu____5158)
        and aux depth n1 names1 t1 =
          let s = aux' depth n1 names1 t1 in
          if print_ranges && (t1.rng <> norng)
          then
            let uu____5166 = FStar_Range.string_of_range t1.rng in
            let uu____5167 = FStar_Range.string_of_use_range t1.rng in
            FStar_Util.format3 "\n;; def=%s; use=%s\n%s\n" uu____5166
              uu____5167 s
          else s in
        aux (Prims.parse_int "0") (Prims.parse_int "0") [] t
let caption_to_string:
  Prims.string FStar_Pervasives_Native.option -> Prims.string =
  fun uu___74_5173  ->
    match uu___74_5173 with
    | FStar_Pervasives_Native.None  -> ""
    | FStar_Pervasives_Native.Some c ->
        let uu____5177 =
          match FStar_Util.splitlines c with
          | [] -> failwith "Impossible"
          | hd1::[] -> (hd1, "")
          | hd1::uu____5192 -> (hd1, "...") in
        (match uu____5177 with
         | (hd1,suffix) ->
             FStar_Util.format2 ";;;;;;;;;;;;;;;;%s%s\n" hd1 suffix)
let rec declToSmt': Prims.bool -> Prims.string -> decl -> Prims.string =
  fun print_ranges  ->
    fun z3options  ->
      fun decl  ->
        let escape s = FStar_Util.replace_char s 39 95 in
        match decl with
        | DefPrelude  -> mkPrelude z3options
        | Caption c ->
            let uu____5223 = FStar_Options.log_queries () in
            if uu____5223
            then
              let uu____5224 =
                FStar_All.pipe_right (FStar_Util.splitlines c)
                  (fun uu___75_5228  ->
                     match uu___75_5228 with | [] -> "" | h::t -> h) in
              FStar_Util.format1 "\n; %s" uu____5224
            else ""
        | DeclFun (f,argsorts,retsort,c) ->
            let l = FStar_List.map strSort argsorts in
            let uu____5247 = caption_to_string c in
            let uu____5248 = strSort retsort in
            FStar_Util.format4 "%s(declare-fun %s (%s) %s)" uu____5247 f
              (FStar_String.concat " " l) uu____5248
        | DefineFun (f,arg_sorts,retsort,body,c) ->
            let uu____5258 = name_macro_binders arg_sorts in
            (match uu____5258 with
             | (names1,binders) ->
                 let body1 =
                   let uu____5290 =
                     FStar_List.map (fun x  -> mkFreeV x norng) names1 in
                   inst uu____5290 body in
                 let uu____5303 = caption_to_string c in
                 let uu____5304 = strSort retsort in
                 let uu____5305 = termToSmt print_ranges (escape f) body1 in
                 FStar_Util.format5 "%s(define-fun %s (%s) %s\n %s)"
                   uu____5303 f (FStar_String.concat " " binders) uu____5304
                   uu____5305)
        | Assume a ->
            let fact_ids_to_string ids =
              FStar_All.pipe_right ids
                (FStar_List.map
                   (fun uu___76_5323  ->
                      match uu___76_5323 with
                      | Name n1 ->
                          Prims.strcat "Name " (FStar_Ident.text_of_lid n1)
                      | Namespace ns ->
                          Prims.strcat "Namespace "
                            (FStar_Ident.text_of_lid ns)
                      | Tag t -> Prims.strcat "Tag " t)) in
            let fids =
              let uu____5328 = FStar_Options.log_queries () in
              if uu____5328
              then
                let uu____5329 =
                  let uu____5330 = fact_ids_to_string a.assumption_fact_ids in
                  FStar_String.concat "; " uu____5330 in
                FStar_Util.format1 ";;; Fact-ids: %s\n" uu____5329
              else "" in
            let n1 = escape a.assumption_name in
            let uu____5335 = caption_to_string a.assumption_caption in
            let uu____5336 = termToSmt print_ranges n1 a.assumption_term in
            FStar_Util.format4 "%s%s(assert (! %s\n:named %s))" uu____5335
              fids uu____5336 n1
        | Eval t ->
            let uu____5338 = termToSmt print_ranges "eval" t in
            FStar_Util.format1 "(eval %s)" uu____5338
        | Echo s -> FStar_Util.format1 "(echo \"%s\")" s
        | RetainAssumptions uu____5340 -> ""
        | CheckSat  ->
            "(echo \"<result>\")\n(check-sat)\n(echo \"</result>\")"
        | GetUnsatCore  ->
            "(echo \"<unsat-core>\")\n(get-unsat-core)\n(echo \"</unsat-core>\")"
        | Push  -> "(push)"
        | Pop  -> "(pop)"
        | SetOption (s,v1) -> FStar_Util.format2 "(set-option :%s %s)" s v1
        | GetStatistics  ->
            "(echo \"<statistics>\")\n(get-info :all-statistics)\n(echo \"</statistics>\")"
        | GetReasonUnknown  ->
            "(echo \"<reason-unknown>\")\n(get-info :reason-unknown)\n(echo \"</reason-unknown>\")"
and declToSmt: Prims.string -> decl -> Prims.string =
  fun z3options  -> fun decl  -> declToSmt' true z3options decl
and declToSmt_no_caps: Prims.string -> decl -> Prims.string =
  fun z3options  -> fun decl  -> declToSmt' false z3options decl
and mkPrelude: Prims.string -> Prims.string =
  fun z3options  ->
    let basic =
      Prims.strcat z3options
        "(declare-sort FString)\n(declare-fun FString_constr_id (FString) Int)\n\n(declare-sort Term)\n(declare-fun Term_constr_id (Term) Int)\n(declare-datatypes () ((Fuel \n(ZFuel) \n(SFuel (prec Fuel)))))\n(declare-fun MaxIFuel () Fuel)\n(declare-fun MaxFuel () Fuel)\n(declare-fun PreType (Term) Term)\n(declare-fun Valid (Term) Bool)\n(declare-fun HasTypeFuel (Fuel Term Term) Bool)\n(define-fun HasTypeZ ((x Term) (t Term)) Bool\n(HasTypeFuel ZFuel x t))\n(define-fun HasType ((x Term) (t Term)) Bool\n(HasTypeFuel MaxIFuel x t))\n;;fuel irrelevance\n(assert (forall ((f Fuel) (x Term) (t Term))\n(! (= (HasTypeFuel (SFuel f) x t)\n(HasTypeZ x t))\n:pattern ((HasTypeFuel (SFuel f) x t)))))\n(declare-fun NoHoist (Term Bool) Bool)\n;;no-hoist\n(assert (forall ((dummy Term) (b Bool))\n(! (= (NoHoist dummy b)\nb)\n:pattern ((NoHoist dummy b)))))\n(define-fun  IsTyped ((x Term)) Bool\n(exists ((t Term)) (HasTypeZ x t)))\n(declare-fun ApplyTF (Term Fuel) Term)\n(declare-fun ApplyTT (Term Term) Term)\n(declare-fun Rank (Term) Int)\n(declare-fun Closure (Term) Term)\n(declare-fun ConsTerm (Term Term) Term)\n(declare-fun ConsFuel (Fuel Term) Term)\n(declare-fun Precedes (Term Term) Term)\n(declare-fun Tm_uvar (Int) Term)\n(define-fun Reify ((x Term)) Term x)\n(assert (forall ((t Term))\n(! (iff (exists ((e Term)) (HasType e t))\n(Valid t))\n:pattern ((Valid t)))))\n(assert (forall ((t1 Term) (t2 Term))\n(! (iff (Valid (Precedes t1 t2)) \n(< (Rank t1) (Rank t2)))\n:pattern ((Precedes t1 t2)))))\n(define-fun Prims.precedes ((a Term) (b Term) (t1 Term) (t2 Term)) Term\n(Precedes t1 t2))\n(declare-fun Range_const (Int) Term)\n(declare-fun _mul (Int Int) Int)\n(declare-fun _div (Int Int) Int)\n(declare-fun _mod (Int Int) Int)\n(assert (forall ((x Int) (y Int)) (! (= (_mul x y) (* x y)) :pattern ((_mul x y)))))\n(assert (forall ((x Int) (y Int)) (! (= (_div x y) (div x y)) :pattern ((_div x y)))))\n(assert (forall ((x Int) (y Int)) (! (= (_mod x y) (mod x y)) :pattern ((_mod x y)))))" in
    let constrs =
      [("FString_const", [("FString_const_proj_0", Int_sort, true)],
         String_sort, (Prims.parse_int "0"), true);
      ("Tm_type", [], Term_sort, (Prims.parse_int "2"), true);
      ("Tm_arrow", [("Tm_arrow_id", Int_sort, true)], Term_sort,
        (Prims.parse_int "3"), false);
      ("Tm_unit", [], Term_sort, (Prims.parse_int "6"), true);
      ((FStar_Pervasives_Native.fst boxIntFun),
        [((FStar_Pervasives_Native.snd boxIntFun), Int_sort, true)],
        Term_sort, (Prims.parse_int "7"), true);
      ((FStar_Pervasives_Native.fst boxBoolFun),
        [((FStar_Pervasives_Native.snd boxBoolFun), Bool_sort, true)],
        Term_sort, (Prims.parse_int "8"), true);
      ((FStar_Pervasives_Native.fst boxStringFun),
        [((FStar_Pervasives_Native.snd boxStringFun), String_sort, true)],
        Term_sort, (Prims.parse_int "9"), true);
      ("LexCons",
        [("LexCons_0", Term_sort, true); ("LexCons_1", Term_sort, true)],
        Term_sort, (Prims.parse_int "11"), true)] in
    let bcons =
      let uu____5669 =
        let uu____5672 =
          FStar_All.pipe_right constrs
            (FStar_List.collect constructor_to_decl) in
        FStar_All.pipe_right uu____5672
          (FStar_List.map (declToSmt z3options)) in
      FStar_All.pipe_right uu____5669 (FStar_String.concat "\n") in
    let lex_ordering =
      "\n(define-fun is-Prims.LexCons ((t Term)) Bool \n(is-LexCons t))\n(assert (forall ((x1 Term) (x2 Term) (y1 Term) (y2 Term))\n(iff (Valid (Precedes (LexCons x1 x2) (LexCons y1 y2)))\n(or (Valid (Precedes x1 y1))\n(and (= x1 y1)\n(Valid (Precedes x2 y2)))))))\n" in
    Prims.strcat basic (Prims.strcat bcons lex_ordering)
let mkBvConstructor: Prims.int -> decls_t =
  fun sz  ->
    let uu____5687 =
      let uu____5706 =
        let uu____5707 = boxBitVecFun sz in
        FStar_Pervasives_Native.fst uu____5707 in
      let uu____5712 =
        let uu____5721 =
          let uu____5728 =
            let uu____5729 = boxBitVecFun sz in
            FStar_Pervasives_Native.snd uu____5729 in
          (uu____5728, (BitVec_sort sz), true) in
        [uu____5721] in
      (uu____5706, uu____5712, Term_sort, ((Prims.parse_int "12") + sz),
        true) in
    FStar_All.pipe_right uu____5687 constructor_to_decl
let __range_c: Prims.int FStar_ST.ref =
  FStar_Util.mk_ref (Prims.parse_int "0")
let mk_Range_const: Prims.unit -> term =
  fun uu____5783  ->
    let i = FStar_ST.op_Bang __range_c in
    (let uu____5832 =
       let uu____5833 = FStar_ST.op_Bang __range_c in
       uu____5833 + (Prims.parse_int "1") in
     FStar_ST.op_Colon_Equals __range_c uu____5832);
    (let uu____5926 =
       let uu____5933 = let uu____5936 = mkInteger' i norng in [uu____5936] in
       ("Range_const", uu____5933) in
     mkApp uu____5926 norng)
let mk_Term_type: term = mkApp ("Tm_type", []) norng
let mk_Term_app: term -> term -> FStar_Range.range -> term =
  fun t1  -> fun t2  -> fun r  -> mkApp ("Tm_app", [t1; t2]) r
let mk_Term_uvar: Prims.int -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let uu____5958 =
        let uu____5965 = let uu____5968 = mkInteger' i norng in [uu____5968] in
        ("Tm_uvar", uu____5965) in
      mkApp uu____5958 r
let mk_Term_unit: term = mkApp ("Tm_unit", []) norng
let elim_box: Prims.bool -> Prims.string -> Prims.string -> term -> term =
  fun cond  ->
    fun u  ->
      fun v1  ->
        fun t  ->
          match t.tm with
          | App (Var v',t1::[]) when (v1 = v') && cond -> t1
          | uu____5989 -> mkApp (u, [t]) t.rng
let maybe_elim_box: Prims.string -> Prims.string -> term -> term =
  fun u  ->
    fun v1  ->
      fun t  ->
        let uu____6001 = FStar_Options.smtencoding_elim_box () in
        elim_box uu____6001 u v1 t
let boxInt: term -> term =
  fun t  ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxIntFun)
      (FStar_Pervasives_Native.snd boxIntFun) t
let unboxInt: term -> term =
  fun t  ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxIntFun)
      (FStar_Pervasives_Native.fst boxIntFun) t
let boxBool: term -> term =
  fun t  ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxBoolFun)
      (FStar_Pervasives_Native.snd boxBoolFun) t
let unboxBool: term -> term =
  fun t  ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxBoolFun)
      (FStar_Pervasives_Native.fst boxBoolFun) t
let boxString: term -> term =
  fun t  ->
    maybe_elim_box (FStar_Pervasives_Native.fst boxStringFun)
      (FStar_Pervasives_Native.snd boxStringFun) t
let unboxString: term -> term =
  fun t  ->
    maybe_elim_box (FStar_Pervasives_Native.snd boxStringFun)
      (FStar_Pervasives_Native.fst boxStringFun) t
let boxBitVec: Prims.int -> term -> term =
  fun sz  ->
    fun t  ->
      let uu____6026 =
        let uu____6027 = boxBitVecFun sz in
        FStar_Pervasives_Native.fst uu____6027 in
      let uu____6032 =
        let uu____6033 = boxBitVecFun sz in
        FStar_Pervasives_Native.snd uu____6033 in
      elim_box true uu____6026 uu____6032 t
let unboxBitVec: Prims.int -> term -> term =
  fun sz  ->
    fun t  ->
      let uu____6044 =
        let uu____6045 = boxBitVecFun sz in
        FStar_Pervasives_Native.snd uu____6045 in
      let uu____6050 =
        let uu____6051 = boxBitVecFun sz in
        FStar_Pervasives_Native.fst uu____6051 in
      elim_box true uu____6044 uu____6050 t
let boxTerm: sort -> term -> term =
  fun sort  ->
    fun t  ->
      match sort with
      | Int_sort  -> boxInt t
      | Bool_sort  -> boxBool t
      | String_sort  -> boxString t
      | BitVec_sort sz -> boxBitVec sz t
      | uu____6063 -> FStar_Exn.raise FStar_Util.Impos
let unboxTerm: sort -> term -> term =
  fun sort  ->
    fun t  ->
      match sort with
      | Int_sort  -> unboxInt t
      | Bool_sort  -> unboxBool t
      | String_sort  -> unboxString t
      | BitVec_sort sz -> unboxBitVec sz t
      | uu____6071 -> FStar_Exn.raise FStar_Util.Impos
let rec print_smt_term: term -> Prims.string =
  fun t  ->
    match t.tm with
    | Integer n1 -> FStar_Util.format1 "(Integer %s)" n1
    | BoundV n1 ->
        let uu____6087 = FStar_Util.string_of_int n1 in
        FStar_Util.format1 "(BoundV %s)" uu____6087
    | FreeV fv ->
        FStar_Util.format1 "(FreeV %s)" (FStar_Pervasives_Native.fst fv)
    | App (op,l) ->
        let uu____6099 = op_to_string op in
        let uu____6100 = print_smt_term_list l in
        FStar_Util.format2 "(%s %s)" uu____6099 uu____6100
    | Labeled (t1,r1,r2) ->
        let uu____6104 = print_smt_term t1 in
        FStar_Util.format2 "(Labeled '%s' %s)" r1 uu____6104
    | LblPos (t1,s) ->
        let uu____6107 = print_smt_term t1 in
        FStar_Util.format2 "(LblPos %s %s)" s uu____6107
    | Quant (qop,l,uu____6110,uu____6111,t1) ->
        let uu____6129 = print_smt_term_list_list l in
        let uu____6130 = print_smt_term t1 in
        FStar_Util.format3 "(%s %s %s)" (qop_to_string qop) uu____6129
          uu____6130
    | Let (es,body) ->
        let uu____6137 = print_smt_term_list es in
        let uu____6138 = print_smt_term body in
        FStar_Util.format2 "(let %s %s)" uu____6137 uu____6138
and print_smt_term_list: term Prims.list -> Prims.string =
  fun l  ->
    let uu____6142 = FStar_List.map print_smt_term l in
    FStar_All.pipe_right uu____6142 (FStar_String.concat " ")
and print_smt_term_list_list: term Prims.list Prims.list -> Prims.string =
  fun l  ->
    FStar_List.fold_left
      (fun s  ->
         fun l1  ->
           let uu____6161 =
             let uu____6162 =
               let uu____6163 = print_smt_term_list l1 in
               Prims.strcat uu____6163 " ] " in
             Prims.strcat "; [ " uu____6162 in
           Prims.strcat s uu____6161) "" l
let getBoxedInteger: term -> Prims.int FStar_Pervasives_Native.option =
  fun t  ->
    match t.tm with
    | App (Var s,t2::[]) when s = (FStar_Pervasives_Native.fst boxIntFun) ->
        (match t2.tm with
         | Integer n1 ->
             let uu____6178 = FStar_Util.int_of_string n1 in
             FStar_Pervasives_Native.Some uu____6178
         | uu____6179 -> FStar_Pervasives_Native.None)
    | uu____6180 -> FStar_Pervasives_Native.None
let mk_PreType: term -> term = fun t  -> mkApp ("PreType", [t]) t.rng
let mk_Valid: term -> term =
  fun t  ->
    match t.tm with
    | App
        (Var
         "Prims.b2t",{
                       tm = App
                         (Var "Prims.op_Equality",uu____6189::t1::t2::[]);
                       freevars = uu____6192; rng = uu____6193;_}::[])
        -> mkEq (t1, t2) t.rng
    | App
        (Var
         "Prims.b2t",{
                       tm = App
                         (Var "Prims.op_disEquality",uu____6206::t1::t2::[]);
                       freevars = uu____6209; rng = uu____6210;_}::[])
        -> let uu____6223 = mkEq (t1, t2) norng in mkNot uu____6223 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_LessThanOrEqual",t1::t2::[]);
                       freevars = uu____6226; rng = uu____6227;_}::[])
        ->
        let uu____6240 =
          let uu____6245 = unboxInt t1 in
          let uu____6246 = unboxInt t2 in (uu____6245, uu____6246) in
        mkLTE uu____6240 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_LessThan",t1::t2::[]);
                       freevars = uu____6249; rng = uu____6250;_}::[])
        ->
        let uu____6263 =
          let uu____6268 = unboxInt t1 in
          let uu____6269 = unboxInt t2 in (uu____6268, uu____6269) in
        mkLT uu____6263 t.rng
    | App
        (Var
         "Prims.b2t",{
                       tm = App
                         (Var "Prims.op_GreaterThanOrEqual",t1::t2::[]);
                       freevars = uu____6272; rng = uu____6273;_}::[])
        ->
        let uu____6286 =
          let uu____6291 = unboxInt t1 in
          let uu____6292 = unboxInt t2 in (uu____6291, uu____6292) in
        mkGTE uu____6286 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_GreaterThan",t1::t2::[]);
                       freevars = uu____6295; rng = uu____6296;_}::[])
        ->
        let uu____6309 =
          let uu____6314 = unboxInt t1 in
          let uu____6315 = unboxInt t2 in (uu____6314, uu____6315) in
        mkGT uu____6309 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_AmpAmp",t1::t2::[]);
                       freevars = uu____6318; rng = uu____6319;_}::[])
        ->
        let uu____6332 =
          let uu____6337 = unboxBool t1 in
          let uu____6338 = unboxBool t2 in (uu____6337, uu____6338) in
        mkAnd uu____6332 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_BarBar",t1::t2::[]);
                       freevars = uu____6341; rng = uu____6342;_}::[])
        ->
        let uu____6355 =
          let uu____6360 = unboxBool t1 in
          let uu____6361 = unboxBool t2 in (uu____6360, uu____6361) in
        mkOr uu____6355 t.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "Prims.op_Negation",t1::[]);
                       freevars = uu____6363; rng = uu____6364;_}::[])
        -> let uu____6377 = unboxBool t1 in mkNot uu____6377 t1.rng
    | App
        (Var
         "Prims.b2t",{ tm = App (Var "FStar.BV.bvult",t0::t1::t2::[]);
                       freevars = uu____6381; rng = uu____6382;_}::[])
        when
        let uu____6395 = getBoxedInteger t0 in FStar_Util.is_some uu____6395
        ->
        let sz =
          let uu____6399 = getBoxedInteger t0 in
          match uu____6399 with
          | FStar_Pervasives_Native.Some sz -> sz
          | uu____6403 -> failwith "impossible" in
        let uu____6406 =
          let uu____6411 = unboxBitVec sz t1 in
          let uu____6412 = unboxBitVec sz t2 in (uu____6411, uu____6412) in
        mkBvUlt uu____6406 t.rng
    | App
        (Var
         "Prims.equals",uu____6413::{
                                      tm = App
                                        (Var "FStar.BV.bvult",t0::t1::t2::[]);
                                      freevars = uu____6417;
                                      rng = uu____6418;_}::uu____6419::[])
        when
        let uu____6432 = getBoxedInteger t0 in FStar_Util.is_some uu____6432
        ->
        let sz =
          let uu____6436 = getBoxedInteger t0 in
          match uu____6436 with
          | FStar_Pervasives_Native.Some sz -> sz
          | uu____6440 -> failwith "impossible" in
        let uu____6443 =
          let uu____6448 = unboxBitVec sz t1 in
          let uu____6449 = unboxBitVec sz t2 in (uu____6448, uu____6449) in
        mkBvUlt uu____6443 t.rng
    | App (Var "Prims.b2t",t1::[]) ->
        let uu___77_6453 = unboxBool t1 in
        {
          tm = (uu___77_6453.tm);
          freevars = (uu___77_6453.freevars);
          rng = (t.rng)
        }
    | uu____6454 -> mkApp ("Valid", [t]) t.rng
let mk_HasType: term -> term -> term =
  fun v1  -> fun t  -> mkApp ("HasType", [v1; t]) t.rng
let mk_HasTypeZ: term -> term -> term =
  fun v1  -> fun t  -> mkApp ("HasTypeZ", [v1; t]) t.rng
let mk_IsTyped: term -> term = fun v1  -> mkApp ("IsTyped", [v1]) norng
let mk_HasTypeFuel: term -> term -> term -> term =
  fun f  ->
    fun v1  ->
      fun t  ->
        let uu____6487 = FStar_Options.unthrottle_inductives () in
        if uu____6487
        then mk_HasType v1 t
        else mkApp ("HasTypeFuel", [f; v1; t]) t.rng
let mk_HasTypeWithFuel:
  term FStar_Pervasives_Native.option -> term -> term -> term =
  fun f  ->
    fun v1  ->
      fun t  ->
        match f with
        | FStar_Pervasives_Native.None  -> mk_HasType v1 t
        | FStar_Pervasives_Native.Some f1 -> mk_HasTypeFuel f1 v1 t
let mk_NoHoist: term -> term -> term =
  fun dummy  -> fun b  -> mkApp ("NoHoist", [dummy; b]) b.rng
let mk_Destruct: term -> FStar_Range.range -> term =
  fun v1  -> mkApp ("Destruct", [v1])
let mk_Rank: term -> FStar_Range.range -> term =
  fun x  -> mkApp ("Rank", [x])
let mk_tester: Prims.string -> term -> term =
  fun n1  -> fun t  -> mkApp ((Prims.strcat "is-" n1), [t]) t.rng
let mk_ApplyTF: term -> term -> term =
  fun t  -> fun t'  -> mkApp ("ApplyTF", [t; t']) t.rng
let mk_ApplyTT: term -> term -> FStar_Range.range -> term =
  fun t  -> fun t'  -> fun r  -> mkApp ("ApplyTT", [t; t']) r
let mk_String_const: Prims.int -> FStar_Range.range -> term =
  fun i  ->
    fun r  ->
      let uu____6560 =
        let uu____6567 = let uu____6570 = mkInteger' i norng in [uu____6570] in
        ("FString_const", uu____6567) in
      mkApp uu____6560 r
let mk_Precedes: term -> term -> FStar_Range.range -> term =
  fun x1  ->
    fun x2  ->
      fun r  ->
        let uu____6582 = mkApp ("Precedes", [x1; x2]) r in
        FStar_All.pipe_right uu____6582 mk_Valid
let mk_LexCons: term -> term -> FStar_Range.range -> term =
  fun x1  -> fun x2  -> fun r  -> mkApp ("LexCons", [x1; x2]) r
let rec n_fuel: Prims.int -> term =
  fun n1  ->
    if n1 = (Prims.parse_int "0")
    then mkApp ("ZFuel", []) norng
    else
      (let uu____6602 =
         let uu____6609 =
           let uu____6612 = n_fuel (n1 - (Prims.parse_int "1")) in
           [uu____6612] in
         ("SFuel", uu____6609) in
       mkApp uu____6602 norng)
let fuel_2: term = n_fuel (Prims.parse_int "2")
let fuel_100: term = n_fuel (Prims.parse_int "100")
let mk_and_opt:
  term FStar_Pervasives_Native.option ->
    term FStar_Pervasives_Native.option ->
      FStar_Range.range -> term FStar_Pervasives_Native.option
  =
  fun p1  ->
    fun p2  ->
      fun r  ->
        match (p1, p2) with
        | (FStar_Pervasives_Native.Some p11,FStar_Pervasives_Native.Some p21)
            ->
            let uu____6646 = mkAnd (p11, p21) r in
            FStar_Pervasives_Native.Some uu____6646
        | (FStar_Pervasives_Native.Some p,FStar_Pervasives_Native.None ) ->
            FStar_Pervasives_Native.Some p
        | (FStar_Pervasives_Native.None ,FStar_Pervasives_Native.Some p) ->
            FStar_Pervasives_Native.Some p
        | (FStar_Pervasives_Native.None ,FStar_Pervasives_Native.None ) ->
            FStar_Pervasives_Native.None
let mk_and_opt_l:
  term FStar_Pervasives_Native.option Prims.list ->
    FStar_Range.range -> term FStar_Pervasives_Native.option
  =
  fun pl  ->
    fun r  ->
      FStar_List.fold_right (fun p  -> fun out  -> mk_and_opt p out r) pl
        FStar_Pervasives_Native.None
let mk_and_l: term Prims.list -> FStar_Range.range -> term =
  fun l  ->
    fun r  ->
      let uu____6699 = mkTrue r in
      FStar_List.fold_right (fun p1  -> fun p2  -> mkAnd (p1, p2) r) l
        uu____6699
let mk_or_l: term Prims.list -> FStar_Range.range -> term =
  fun l  ->
    fun r  ->
      let uu____6714 = mkFalse r in
      FStar_List.fold_right (fun p1  -> fun p2  -> mkOr (p1, p2) r) l
        uu____6714
let mk_haseq: term -> term =
  fun t  ->
    let uu____6722 = mkApp ("Prims.hasEq", [t]) t.rng in mk_Valid uu____6722