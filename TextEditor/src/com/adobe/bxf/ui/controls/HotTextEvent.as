//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/controls/HotTextEvent.as $
//  $DateTime: 2009/12/22 14:38:02 $
//  $Revision: #1 $
//  $Change: 733743 $
//
//  ADOBE CONFIDENTIAL
//
//  Copyright 2007-08 Adobe Systems Incorporated. All rights reserved.
//
//  NOTICE:  All information contained herein is, and remains
//  the property of Adobe Systems Incorporated and its suppliers,
//  if any.  The intellectual and technical concepts contained
//  herein are proprietary to Adobe Systems Incorporated and its
//  suppliers and may be covered by U.S. and Foreign Patents,
//  patents in process, and are protected by trade secret or copyright law.
//  Dissemination of this information or reproduction of this material
//  is strictly forbidden unless prior written permission is obtained
//  from Adobe Systems Incorporated.
//
//========================================================================================
package com.adobe.bxf.ui.controls
{
	import flash.events.Event;

	public class HotTextEvent extends Event
	{
		public static const CHANGE:String = "change";
		public static const FINISH_CHANGE:String = "finishChange";
		public static const ACTIVE:String = "active";
		public static const INACTIVE:String = "inactive";

	/**
     *  The new value of the HotText.
      */
    	public var value:Object;

        public function HotTextEvent(type:String, value:Object = null,
	    							bubbles:Boolean = false,
	                                cancelable:Boolean = false,
	                                triggerEvent:Event = null,
	                                clickTarget:String = null, keyCode:int = -1)
	    {
	        super(type, bubbles, cancelable);
        	this.value = value;
        }

	}
}