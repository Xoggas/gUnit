function TestSuite(name) constructor
{
	m_name = name;
	m_tests = [];
	
	/// @returns {undefined}
	before = function()
	{
	}
	
	/// @returns {undefined}
	before_each = function()
	{
	}
	
	/// @returns {undefined}
	after = function() 
	{
	}
	
	/// @returns {undefined}
	after_each = function()
	{
	}
	
	/// @arg {string} name
	/// @arg {function} 
	it = function(name, callback)
	{
		array_push(m_tests, new TestCase(name, callback));
	}
	
	/// @returns {undefined}
	run_all = function()
	{
		show_debug_message("\n\nTest Suite: {0}\n", m_name);
	
		var start_time = get_timer();
	
		before();
	
		m_passed_tests = 0;
		
		m_failed_tests = 0;
		
		array_foreach(m_tests, function(test_case, index)
		{
			before_each();
			
			var passed = run_single(test_case);
			
			if(passed)
			{
				m_passed_tests++;
			}
			else
			{
				m_failed_tests++;
			}
			
			after_each();
		});
	
		after();
		
		var execution_time = get_timer() - start_time;
		
		show_debug_message("Total Passed: {0}\nTotal Failed: {1}\nTotal Elapsed Time: {2}\n\n", 
							m_passed_tests, m_failed_tests, execution_time);				
	}
	
	/// @arg {struct.TestCase} test_case
	/// @returns {bool}
	run_single = function(test_case)
	{
		try
		{			
			var callback = test_case.get_callback();
			
			var start_time = get_timer();
			
			callback();
			
			var execution_time = get_timer() - start_time;
			
			show_debug_message("Test: {0}\nPassed ✔\nExecution Time: {1}\n", test_case.get_name(), execution_time);
			
			return true;
		}
		catch(exception)
		{
			show_debug_message("Test: {0}\nFailed ✘\nError: {1}\n", test_case.get_name(), exception);
			
			return false;
		}
	}
}