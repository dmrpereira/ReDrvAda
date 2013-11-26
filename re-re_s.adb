package body Formal_Language.Re.Re_S is

   function Make_Re_S(S:in Re_Access) return Re_Access is
      Foo : Re_Access;
   begin
      Foo := new Re_S'(Re_Id => 5, Stared_Re => S);
      return Foo;
   end Make_Re_S;

   function Get_Re_Stared(R:in Re_S) return Re_Access is
   begin
      return R.Stared_Re;
   end Get_Re_Stared;

   function "<"(R1:in Re_S;R2:in Re_Type'Class) return Boolean is
   begin
      if R1.Re_Id < R2.Re_Id then
         return True;
      elsif R1.Re_Id = R2.Re_Id then
         return (Re_Access_Lt(R1.Stared_Re,Re_S(R2).Stared_Re));
      else
         return False;
      end if;
   end "<";

   function "="(R1:in Re_S;R2:in Re_Type'Class) return Boolean is
   begin
      if R2.Re_Id /= R1.Re_Id then
         return False;
      else
         return (Re_Access_Eq(R1.Stared_Re,Re_S(R2).Stared_Re));
      end if;
   end "=";

   function Nullable(R:in Re_S) return Boolean is
   begin
      return True;
   end Nullable;

   function Print(R:in Re_S) return Unbounded_String is
      Str : Unbounded_String := Null_Unbounded_String;
   begin
      Append(Str,"(");
      Append(Str,Print(R.Stared_Re.all));
      Append(Str,")*");
      return Str;
   end Print;

end Formal_Language.Re.Re_S;
