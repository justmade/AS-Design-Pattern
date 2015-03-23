package Component
{
	public class ComponentTest
	{
		public function ComponentTest()
		{
			var root:Composite = new Composite("Root");
			
			var n1:Composite = new Composite("S1");
			n1.add(new Leaf("Leaf 1"));
			n1.add(new Leaf("Leaf 2"));
			root.add(n1);
			
			var n2:Composite = new Composite("S2");
			n2.add(new Leaf("Leaf 3"));
			n2.add(new Leaf("Leaf 4"));
			n2.add(new Leaf("Leaf 5"));
			root.add(n2);
			
			root.add(new Leaf("Leaf 6"));
			
			root.operation();
			
		}
	}
}