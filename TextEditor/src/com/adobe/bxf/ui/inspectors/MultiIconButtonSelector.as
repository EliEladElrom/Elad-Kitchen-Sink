//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/inspectors/MultiIconButtonSelector.as $
//  $DateTime: 2009/12/22 14:38:02 $
//  $Revision: #1 $
//  $Change: 733743 $
//
//  ADOBE CONFIDENTIAL
//
//  Copyright 2008 Adobe Systems Incorporated. All rights reserved.
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

package com.adobe.bxf.ui.inspectors
{
	import flash.events.MouseEvent;

	import mx.controls.Button;

	public class MultiIconButtonSelector extends PropertyEditorBase implements IPropertyEditor
	{
		/**
		 * MultiIconButtonSelector constructor
		 * @param inLabel string for label next to control
		 * @param inPropName is the name of the property being edited
		 * @param inIconClasses is an array of Class for the row of buttons
		 * @param inPropertyValues is an array of property values strings, which correspond one-to-one to the icons.
		 * @param inStyle optional style sheet entry
		 */
		public function MultiIconButtonSelector(inLabel:String, inPropName:String, inIconClasses:Array,
					inPropertyValues:Array,  inStyle:String = "")
		{
			super(inLabel);
			mChangeNotify = new ValueChangeNotifier(inPropName, this);
			mIconClasses = inIconClasses;
			mPropValues = inPropertyValues;
			if (mIconClasses == null || mPropValues == null || mPropValues.length != mIconClasses.length)
				throw new Error("MultiIconButtonSelector: bad inputs.");
			mStyle = inStyle;
			if (mStyle != "")
				styleName = mStyle;
		}

		override protected function createChildren():void
		{
			super.createChildren();
			if (mButtons == null)
			{
				mButtons = [];
				var n:int = mPropValues.length;
				for (var i:int = 0; i < n; ++i)
				{
					var btn:Button = new Button();
					if (mStyle != "")
						btn.styleName = mStyle;
					btn.toggle = true;
					btn.height = 16;
					btn.width = 17;
					btn.focusEnabled = false;
					btn.setStyle("icon", mIconClasses[i]);
					btn.name = mPropValues[i];
					addChild(btn);
					btn.addEventListener(MouseEvent.CLICK, onMouseClick);
					mButtons.push(btn);
				}
			}
			if (mValue)
				if (mValue is Array)
					setMultiValue(mValue as Array, "");
				else
					setValueAsString(mValue as String, "");
		}

		public function onMouseClick(inEvt:MouseEvent):void
		{
			mChangeNotify.ValueCommitted((inEvt.target as Button).name);
		}

		public function setValueAsString(inValue:String, inProperty:String):void
		{
			mValue = inValue;
			for each(var btn:Button in mButtons)
				btn.selected = (btn.name == mValue);
		}

		public function setMultiValue(inValues:Array, inProperty:String):void
		{
			mValue = inValues;
			for each(var btn:Button in mButtons)
				btn.selected = (mValue.indexOf(btn.name) != -1);
		}

		private var mChangeNotify:ValueChangeNotifier;
		private var mIconClasses:Array;
		private var mPropValues:Array;
		private var mButtons:Array = null;
		private var mStyle:String;
		private var mValue:Object = null;
	}
}