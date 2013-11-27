package body Words is
   
   function Head(W:in Word) return Sy is
   begin
      return W.Head;
   end Head;
   
   function Tail(W:in Word) return Word is
   begin
      return W.Tail;
   end Tail;
   
   function Cons(S:in Sy;W:in Word) return Word is
      W_Tmp : Word := new Word_Elem'(Head => S,Tail => W);
   begin
      return W_Tmp;
   end Cons;
   
   function Nil return Word is
   begin
      return Null_Word;
   end Nil;
   
   function Is_Nil(W:in Word) return Boolean is
   begin
      return (W = Null_Word);
   end Is_Nil;
   
   function Length(W:in Word) return Natural is
   begin
      if Is_Nil(W) then
	 return 0;
      else
	 return (1 + Length(Tail(W)));
      end if;
   end Length;
      
end Words;
