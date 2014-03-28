package body Re.Re1 is

   function Make_Re1 return Re_Access is
      Foo : Re_Access;
   begin
      Foo := new Re1'(Re_Id => 1);
      return Foo;
   end Make_Re1;

   function "<"(R1:in Re1;R2:in Re_Type'Class) return Boolean is
   begin
      return (R2.Re_Id /= 0 and R2.Re_Id /= 1);
   end "<";

   function "="(R1:in Re1;R2:in Re_Type'Class) return Boolean is
   begin
      return (R1.Re_Id = R2.Re_Id);
   end "=";

   function Nullable(R:in Re1) return Boolean is
   begin
      return True;
   end Nullable;

   function Print(R:in Re1) return Unbounded_String is
   begin
      return To_Unbounded_String("1");
   end Print;


end Re.Re1;
