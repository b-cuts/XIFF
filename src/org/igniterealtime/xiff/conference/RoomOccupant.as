/*
 * License
 */
package org.igniterealtime.xiff.conference
{
	import flash.events.EventDispatcher;

	import org.igniterealtime.xiff.core.UnescapedJID;
	import org.igniterealtime.xiff.data.im.Contact;
	import org.igniterealtime.xiff.data.im.RosterItemVO;

	public class RoomOccupant extends EventDispatcher implements Contact
	{
		private var _affiliation:String;

		private var _jid:UnescapedJID;

		private var _nickname:String;

		private var _role:String;

		private var _room:Room;

		private var _show:String;

		private var _uid:String;

		public function RoomOccupant( nickname:String, show:String, affiliation:String,
										role:String, jid:UnescapedJID, room:Room )
		{
			this.displayName = nickname;
			this.show = show;
			this.affiliation = affiliation;
			this.role = role;
			this.jid = jid;
			this.room = room;
		}

		[Bindable]
		public function get affiliation():String
		{
			return _affiliation;
		}

		public function set affiliation( newAffil:String ):void
		{
			_affiliation = newAffil;
		}

		[Bindable]
		public function get displayName():String
		{
			return _nickname;
		}

		public function set displayName( name:String ):void
		{
			_nickname = name;
		}

		[Bindable]
		public function get jid():UnescapedJID
		{
			return _jid;
		}

		public function set jid( newJID:UnescapedJID ):void
		{
			_jid = newJID;
		}

		[Bindable]
		public function get online():Boolean
		{
			return true;
		}

		public function set online( newOnline:Boolean ):void
		{
			//RoomOccupants can't exist unless they're online
		}

		[Bindable]
		public function get role():String
		{
			return _role;
		}

		public function set role( newRole:String ):void
		{
			_role = newRole;
		}

		[Bindable]
		public function get room():Room
		{
			return _room;
		}

		public function set room( newRoom:Room ):void
		{
			_room = newRoom;
		}

		/**
		 * If there isn't a roster item associated with this room occupant 
		 * (for example, if the room is anonymous), this will return null
		 */
		public function get rosterItem():RosterItemVO
		{
			if ( !jid )
				return null;
			return RosterItemVO.get( jid, true );
		}

		[Bindable]
		public function get show():String
		{
			return _show;
		}

		public function set show( newShow:String ):void
		{
			_show = newShow;
		}

		public function get uid():String
		{
			return _uid;
		}

		public function set uid( i:String ):void
		{
			_uid = i;
		}
	}
}