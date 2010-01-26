/*
 * Copyright (C) 2003-2009 Igniterealtime Community Contributors
 *
 *     Daniel Henninger
 *     Derrick Grigg <dgrigg@rogers.com>
 *     Juga Paazmaya <olavic@gmail.com>
 *     Nick Velloff <nick.velloff@gmail.com>
 *     Sean Treadway <seant@oncotype.dk>
 *     Sean Voisen <sean@voisen.org>
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.igniterealtime.xiff.data.ping
{
	import org.igniterealtime.xiff.data.ExtensionClassRegistry;
	import org.igniterealtime.xiff.data.IExtension;
	import org.igniterealtime.xiff.data.ISerializable;

	/**
	 * Ping the server, thus keeping the connection open.
	 * @see http://xmpp.org/extensions/xep-0199.html
	 */
	public class PingExtension implements IExtension, ISerializable
	{
		public static const ELEMENT_NAME:String = "ping";

		public static const NS:String = "urn:xmpp:ping";

		public static function enable():Boolean
		{
			return ExtensionClassRegistry.register( PingExtension );
		}

		/**
		 * @param	node (XML) The node that should be used as the data container.
		 * @return	On success, return true.
		 */
		public function deserialize( node:XML ):Boolean
		{
			return true;
		}

		public function getElementName():String
		{
			return PingExtension.ELEMENT_NAME;
		}

		public function getNS():String
		{
			return PingExtension.NS;
		}

		/**
		 *
		 * @param	parentNode (XML) The container of the XML.
		 * @return	On success, return true.
		 */
		public function serialize( parentNode:XML ):Boolean
		{
			var xmlNode:XML = <{ PingExtension.ELEMENT_NAME }/>;
			xmlNode.setNamespace( PingExtension.NS );
			parentNode.appendChild( xmlNode );
			return true;
		}
	}
}
