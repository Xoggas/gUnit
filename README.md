# gUnit

gUnit is a lightweight unit testing library designed specifically for Game Maker Studio. It provides an easy and
intuitive way to write and run unit tests for your GML code, helping you ensure the reliability and correctness of your
game's logic.

# Features

gUnit provides basic features for unit testing:
- 📦 Splitting code into test suites
- ✅ Basic assertions

# Usage Example

## Dummy component

```gml
function TestableComponent() constructor
{
	/// @returns {real}
	get_one = function()
	{
		return 1;
	}
	
	/// @returns {real}
	get_two = function()
	{
		return 2;
	}
}
```

## Test Suite

```gml
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
```

## Room Creation Code

```gml
var test_suite = new Test();

test_suite.run_all();
```

## Output

```
Test Suite: Testable Component Tests

Test: Calls get_one, should return 1
Passed ✔
Execution Time: 15

Test: Calls get_two, shoudln't return 1
Passed ✔
Execution Time: 4

Total Passed: 2
Total Failed: 0
Total Elapsed Time: 184
```

# Docs

> ## Struct TestSuite
> ### Constructor
> ### TestSuite(name)
> name `string` - the name of the test suite.
> ### Methods
> ### it(name, callback)
> #### Description:
> Creates a new test case.
> ####  Arguments:
> name `string` - the name of the test case.\
> callback `function` - the test function.
> ### run_all()
> #### Description:
> Runs all tests.
> ### before()
> #### Description:
> Runs before all tests.
> ### before_each()
> #### Description:
> Runs before each test.
> ### after()
> #### Description:
> Runs after all tests.
> ### after_each()
> #### Description:
> Runs after each test.

> ## Global 
> ### Functions
> ### assert_are_equal(a, b)
> #### Description:
> Compares two arguments, throws an error if not equal.
> ####  Arguments:
> a `any` - the left argument.\
> b `any` - the right argument.
> ### assert_are_not_equal(a, b)
> #### Description:
> Compares two arguments, throws an error if equal.
> ####  Arguments:
> a `any` - the left argument.\
> b `any` - the right argument.
> ### assert_is_true(v)
> #### Description:
> Checks if `v` is true, throws an error if not.
> ####  Arguments:
> v `bool` - the flag.
> ### assert_is_false(v)
> #### Description:
> Checks if `v` is false, throws an error if not.
> ####  Arguments:
> v `bool` - the flag.
> ### assert_throws_exception(callback)
> #### Description:
> Checks if `callback` throws an exception.
> ####  Arguments:
> callback `function` - the function to check.