/*
 * License
 */
package org.igniterealtime.xiff.data.muc
{
	import flash.xml.XMLNode;
	
	import org.igniterealtime.xiff.data.Extension;
	import org.igniterealtime.xiff.data.IExtension;
	import org.igniterealtime.xiff.data.ISerializable;
	
	/**
	 * Implements the base MUC protocol schema from <a href="http://www.xmpp.org/extensions/xep-0045.html">XEP-0045<a> for multi-user chat.
	 *
	 * This extension is typically used to test for the presence of MUC enabled conferencing 
	 * service, or a MUC related error condition.
	 *
	 * @param	parent (Optional) The containing XMLNode for this extension
	 */
	public class MUCExtension extends Extension implements IExtension, ISerializable
	{
		// Static class variables to be overridden in subclasses;
		public static const NS:String = "http://jabber.org/protocol/muc";
		public static const ELEMENT:String = "x";
	
		private var myHistoryNode:XMLNode;
		private var myPasswordNode:XMLNode;
	
		public function MUCExtension( parent:XMLNode=null )
		{
			super(parent);
		}
	
		public function getNS():String
		{
			return MUCExtension.NS;
		}
	
		public function getElementName():String
		{
			return MUCExtension.ELEMENT;
		}
	
		public function serialize( parent:XMLNode ):Boolean
		{
			if (exists(getNode().parentNode)) {
				return false;
			}
			var node:XMLNode = getNode().cloneNode(true);
			for each(var ext:IExtension in getAllExtensions()) {
				if (ext is ISerializable) {
					ISerializable(ext).serialize(node);
				}
			}
			parent.appendChild(node);
			return true;
		}
	
		public function deserialize( node:XMLNode ):Boolean
		{
			setNode(node);
	
			for each( var child:XMLNode in node.childNodes ) {
				switch( child.nodeName )
				{
					case "history":
						myHistoryNode = child;
						break;
						
					case "password":
						myPasswordNode = child;
						break;
				}
			}
			return true;
		}
		
		public function addChildNode(childNode:XMLNode):void 
		{
			getNode().appendChild(childNode);
		}
	
		/**
		 * If a room is password protected, add this extension and set the password
		 */
		public function get password():String
		{
			if(myPasswordNode && myPasswordNode.firstChild)
				return myPasswordNode.firstChild.nodeValue;
			
			return null;
		}
	
		public function set password(val:String):void
		{
			myPasswordNode = replaceTextNode(getNode(), myPasswordNode, "password", val);
		}
	
		/**
		 * This is property allows a user to retrieve a server defined collection of previous messages.
		 * Set this property to "true" to retrieve a history of the dicussions.
		 */
		public function get history():Boolean
		{
			return exists(myHistoryNode);
		}
	
		public function set history(val:Boolean):void
		{
			if (val) {
				myHistoryNode = ensureNode(myHistoryNode, "history");
			} else {
				myHistoryNode.removeNode();
				myHistoryNode = null;
				//delete myHistoryNode;
			}
		}
	
		/**
		 * Size based condition to evaluate by the server for the maximum characters to return during history retrieval
		 */
		public function get maxchars():Number
		{
			return Number(myHistoryNode.attributes.maxchars);
		}
	
		public function set maxchars(val:Number):void
		{
			myHistoryNode = ensureNode(myHistoryNode, "history");
			myHistoryNode.attributes.maxchars = val.toString();
		}
	
		/**
		 * Protocol based condition for the number of stanzas to return during history retrieval
		 */
		public function get maxstanzas():Number
		{
			return Number(myHistoryNode.attributes.maxstanzas);
		}
	
		public function set maxstanzas(val:Number):void
		{
			myHistoryNode = ensureNode(myHistoryNode, "history");
			myHistoryNode.attributes.maxstanzas = val.toString();
		}
	
		/**
		 * Time based condition to retrive all messages for the last N seconds.
		 */
		public function get seconds():Number
		{
			return Number(myHistoryNode.attributes.seconds);
		}
	
		public function set seconds(val:Number):void
		{
			myHistoryNode = ensureNode(myHistoryNode, "history");
			myHistoryNode.attributes.seconds = val.toString();
		}
	
		/**
		 * Time base condition to retrieve all messages from a given time formatted in the format described in 
		 * <a href="http://xmpp.org/extensions/xep-0082.html">XEP-0082</a>.
		 *
		 */
		public function get since():String
		{
			return myHistoryNode.attributes.since;
		}
	
		public function set since(val:String):void
		{
			myHistoryNode = ensureNode(myHistoryNode, "history");
			myHistoryNode.attributes.since = val;
		}
	}
}