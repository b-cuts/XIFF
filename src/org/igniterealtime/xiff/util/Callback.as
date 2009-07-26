/*
 * License
 */
package org.igniterealtime.xiff.util
{
	/**
	 * Sets an callback function
	 */
	public class Callback
	{
		private var _scope:Object;
		private var _callback:Function;
		private var _args:Array;
		
		/**
		 * 
		 * @param	scope
		 * @param	callback
		 * @param	... args
		 */
		public function Callback(scope:Object, callback:Function, ... args)
		{
			_scope = scope;
			_callback = callback;
			_args = args.slice();
		}
		
		/**
		 * 
		 * @param	... args
		 * @return
		 */
		public function call(... args):Object 
		{
			var callbackArgs:Array = _args.slice();
			for each(var arg:Object in args)
			{
				callbackArgs.push(arg);
			}

			return _callback.apply(_scope, callbackArgs);
		}
	}
}