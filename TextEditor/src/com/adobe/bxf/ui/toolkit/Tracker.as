//========================================================================================
//  $File: //a3t/argon/branches/v1/1.0/dev/sdk/samples/flex/textLayout_ui/src/bxf/ui/toolkit/Tracker.as $
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

package com.adobe.bxf.ui.toolkit
{
	import com.adobe.bxf.ui.utils.EffectiveStage;
	import mx.core.UIComponent;
	import mx.managers.ISystemManager;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class Tracker extends UIComponent implements ITrackerInterface
	{
		public function Tracker(inPeerToTrackTo:UIComponent, inStageX:int, inStageY:int)
		{
			super();
			mouseEnabled = false;
			sm = inPeerToTrackTo.systemManager.topLevelSystemManager;
			x = inStageX;
			y = inStageY;
			mPeerToTrackTo = inPeerToTrackTo;
			mPeerToTrackTo.parent.addChild(this);
			EffectiveStage(this).addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove, true);
			sm.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, true);
			EffectiveStage(this).addEventListener(Event.MOUSE_LEAVE, onMouseLeave, false);
		}

		public function Remove():void
		{
			EffectiveStage(this).removeEventListener(Event.MOUSE_LEAVE, onMouseLeave, false);
			EffectiveStage(this).removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove, true);
			sm.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, true);
			mPeerToTrackTo.parent.removeChild(this);
			mPeerToTrackTo = null;
		}

		/**	Override to get cursor adjust hook and mouse down.
		 * @param inMouseEvent mouse info.
		 * @param inCursorAdjust true if this is a mouse up track.*/
		public function BeginTracking(inMouseEvent:MouseEvent, inCursorAdjust:Boolean):void
		{
			mLastMouseEvent = inMouseEvent;
			TrackPoint(inMouseEvent, true);
		}

		/**	Override to get mouse move.
		 * @param inMouseEvent mouse info.*/
		public function ContinueTracking(inMouseEvent:MouseEvent):void
		{
			TrackPoint(inMouseEvent, false);
		}

		/**	Override to get mouse up.
		 * @param inMouseEvent mouse info.*/
		public function EndTracking(inMouseEvent:MouseEvent):void
		{
			TrackPoint(inMouseEvent, false);
		}

		protected function TrackPoint(inMouseEvent:MouseEvent, inAlsoSetAnchor:Boolean): void
		{
			mTrackPt.x = inMouseEvent.stageX;
			mTrackPt.y = inMouseEvent.stageY;
			mTrackPt = globalToLocal(mTrackPt);
			if (inAlsoSetAnchor)
				mAnchorPt = mTrackPt.clone();
		}

		private function onMouseMove(evt:MouseEvent):void
		{
			mLastMouseEvent = evt;
			ContinueTracking(evt);
		}

		private function onMouseUp(evt:MouseEvent):void
		{
			EndTracking(evt);
			Remove();
		}

		private function onMouseLeave(evt:Event):void
		{
			EndTracking(mLastMouseEvent);
			Remove();
		}


		private var mPeerToTrackTo:UIComponent = null;
		private var sm:ISystemManager = null;
		private var mLastMouseEvent:MouseEvent = null;
		protected var mTrackPt:Point = new Point;
		protected var mAnchorPt:Point = new Point;
	}
}