/// @arg {any} a
/// @arg {any} b
function assert_are_equal(a, b)
{
	if(a != b)
	{
		throw string("{0} != {1}", a, b);
	}
}
	
/// @arg {any} a
/// @arg {any} b
function assert_are_not_equal(a, b)
{
	if(a == b)
	{
		throw string("{0} == {1}", a, b);
	}
}
	
/// @arg {bool} v
function assert_is_false(v)
{
	if(v == true)
	{
		throw "The value was true";
	}
}
	
/// @arg {bool} v
function assert_is_true(v)
{
	if(v == false)
	{
		throw "The value was false";
	}
}
	
/// @arg {function} callback
function assert_throws_exception(callback)
{
	try
	{
		callback();
	}
	catch(exception)
	{
		throw "Callback throwed an exception";
	}
}