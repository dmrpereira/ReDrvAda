generic

package Formal_Language.Re.Re_S is

   type Re_S is new Re_Type with private;

   function "<"(R1:in Re_S;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re_S;R2:in Re_Type'Class) return Boolean;

   function Make_Re_S(S:in Re_Access) return Re_Access;

   function Get_Re_Stared(R:in Re_S) return Re_Access;

   function Nullable(R:in Re_S) return Boolean;

   function Print(R:in Re_S) return Unbounded_String;

private

   type Re_S is new Re_Type with
      record
         Stared_Re : Re_Access ;
      end record;

end Formal_Language.Re.Re_S;
