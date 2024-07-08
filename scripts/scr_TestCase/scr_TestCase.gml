/// @arg {string} name
/// @arg {function} callback 
function TestCase(name, callback) constructor
{
	m_name = name;
	m_callback = callback;
	
	/// @returns {string}
	get_name = function() 
	{
		return m_name;
	}
	
	/// @returns {function}
	get_callback = function()
	{
		return m_callback;
	}
}