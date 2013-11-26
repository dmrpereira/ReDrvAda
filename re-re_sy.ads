generic

package Formal_Language.Re.Re_Sy is

   type Re_Sy is new Re_Type with private;

   function "<"(R1:in Re_Sy;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re_Sy;R2:in Re_Type'Class) return Boolean;

   function Make_Re_Sy(S:in Sy) return Re_Access;

   function Get_Re_Sy(R:in Re_Sy) return Sy;

   function Nullable(R:in Re_Sy) return Boolean;

   function Print(R:in Re_Sy) return Unbounded_String;

private

   type Re_Sy is new Re_Type with
      record
         Sy_Val : Sy ;
      end record;

end Formal_Language.Re.Re_Sy;
