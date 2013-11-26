package body Formal_Language.Re.Re_Sy is

   function Make_Re_Sy(S:in Sy) return Re_Access is
      Foo : Re_Access;
   begin
      Foo := new Re_Sy'(Re_Id => 2, Sy_Val => S);
      return Foo;
   end Make_Re_Sy;

   function Get_Re_Sy(R:in Re_Sy) return Sy is
   begin
      return R.Sy_Val;
   end Get_Re_Sy;

   function "<"(R1:in Re_Sy;R2:in Re_Type'Class) return Boolean is
   begin
      if R1.Re_Id = R2.Re_Id then
         return (R1.Sy_Val < Re_Sy(R2).Sy_Val);
      elsif R2.Re_Id > 2 then
         return False;
      else
         return True;
      end if;
   end "<";

   function "="(R1:in Re_Sy;R2:in Re_Type'Class) return Boolean is
   begin
      if R1.Re_Id = R2.Re_Id then
         return (R1.Sy_Val = Re_Sy(R2).Sy_Val);
      else
         return False;
      end if;
   end "=";

   function Nullable(R:in Re_Sy) return Boolean is
   begin
      return False;
   end Nullable;

   function Print(R:in Re_Sy) return Unbounded_String is
      Str : Unbounded_String := Null_Unbounded_String;
   begin
      Append(Str,"{");
      Append(Str,String_Repr(R.Sy_Val));
      Append(Str,"}");
      return Str;
   end Print;

end Formal_Language.Re.Re_Sy;
