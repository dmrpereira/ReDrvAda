generic

package Re.Re1 is

   type Re1 is new Re_Type with private;

   function "<"(R1:in Re1;R2:in Re_Type'Class) return Boolean;
   function "="(R1:in Re1;R2:in Re_Type'Class) return Boolean;

   function Make_Re1 return Re_Access;

   function Print(R:in Re1) return Unbounded_String;

   function Nullable(R:in Re1) return Boolean;

private

   type Re1 is new Re_Type with null record;

end Re.Re1;
