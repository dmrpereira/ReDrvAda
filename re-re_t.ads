generic

package Formal_Language.Re.Re_T is

   type Re_T is new Re_Type with private;

   function "<"(R1:in Re_T;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re_T;R2:in Re_Type'Class) return Boolean;

   function Make_Re_T(S:in Re_Access;Ii,Ie:in Natural) return Re_Access with
     Pre => (Ii <= Ie);

   function Get_Re_Timed(R:in Re_T) return Re_Access;
   function Get_Init_Interval(R:in Re_T) return Natural;
   function Get_End_Interval(R:in Re_T) return Natural;

   function Nullable(R:in Re_T) return Boolean;

   function Print(R:in Re_T) return Unbounded_String;

private

   type Re_T is new Re_Type with
      record
         Timed_Re : Re_Access ;
         Init_Interval : Natural;
         End_Interval : Natural;
      end record;
   -- with Dynamic_Predicate => (Re_T.Init_Interval <= Re_T.End_Interval);

end Formal_Language.Re.Re_T;
