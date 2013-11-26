package body Formal_Language.Re.Re0 is

   function Make_Re0 return Re_Access is
      Foo : Re_Access ;
   begin
      Foo := new Re0'(Re_Id => 0);
      return Foo;
   end Make_Re0;


   function "<"(R1:in Re0;R2:in Re_Type'Class) return Boolean is
   begin
      return (R1.Re_Id < R2.Re_Id);
   end "<";

   function "="(R1:in Re0;R2:in Re_Type'Class) return Boolean is
   begin
      return (R1.Re_Id = R2.Re_Id);
   end "=";

   function Nullable(R:in Re0) return Boolean is
   begin
      return false;
   end Nullable;

   function Print(R:in Re0) return Unbounded_String is
   begin
      return (To_Unbounded_String("0"));
   end Print;

end Formal_Language.Re.Re0;
