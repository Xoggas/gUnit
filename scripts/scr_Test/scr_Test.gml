function Test() : TestSuite("Testable Component Tests") constructor 
{
	before = function()
	{
		m_testable_component = new TestableComponent();
	}
	
	it("Calls get_one, should return 1", function()
	{
		var value = m_testable_component.get_one();
		assert_are_equal(value, 1);
	});
	
	it("Calls get_two, shoudln't return 1", function()
	{
		var value = m_testable_component.get_two();
		assert_are_not_equal(value, 1);
	});
}