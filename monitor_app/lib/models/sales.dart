class Sales{
  double temperatura;
  String ts;

  Sales(this.temperatura, this.ts);
  
  Sales.fromMap(Map<String,dynamic>map)
  :assert(map['temperatura']!=null),
  assert(map['ts']!=null),
   temperatura=map['temperatura'],
   ts=map['ts'];

   @override
   String toString() => "Record<$temperatura:$ts>";

}