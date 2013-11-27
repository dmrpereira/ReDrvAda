generic 
   type Sy is private;
   with function Sy_Print(S:in Sy) return String;
   
package Words is
   
   type Word is private;
   
   function Head(W:in Word) return Sy;
   function Tail(W:in Word) return Word;
   
   function Cons(S:in Sy;W:in Word) return Word;
   function Nil return Word;
   
   function Is_Nil(W:in Word) return Boolean;
   function Length(W:in Word) return Natural;
   
   
private
   
   type Word_Elem;
   
   type Word is access all Word_Elem;
   
   type Word_Elem is 
      record
	 Head : Sy;
	 Tail : Word;
      end record;
   
   Null_Word : constant Word := null;
   
   
end Words;
