/**
 * Created by nomean42 on 17.12.15.
 */
function f ()
{
	return {
		f: f
	}
}

console.log(f().f);