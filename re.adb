package body Re is
   
   function Re_Access_Eq(R1:in Re_Access;R2:in Re_Access) return Boolean is
   begin
      return Re."="(R1.all,R2.all);
   end Re_Access_Eq;
   
   
   function Re_Access_Lt(R1:in Re_Access;R2:in Re_Access) return Boolean is
   begin
      return Re."<"(R1.all,R2.all);
   end Re_Access_Lt;
   
end Re;
