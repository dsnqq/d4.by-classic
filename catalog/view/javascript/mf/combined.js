var MFP_RTL = false;

/*! jQuery UI - v1.11.4 - 2015-10-20
* http://jqueryui.com
* Includes: core.js, widget.js, mouse.js, slider.js
* Copyright 2015 jQuery Foundation and other contributors; Licensed MIT */

(function(e){"function"==typeof define&&define.amd?define(["jquery"],e):e(jQuery)})(function(e){function t(t,s){var n,a,o,r=t.nodeName.toLowerCase();return"area"===r?(n=t.parentNode,a=n.name,t.href&&a&&"map"===n.nodeName.toLowerCase()?(o=e("img[usemap='#"+a+"']")[0],!!o&&i(o)):!1):(/^(input|select|textarea|button|object)$/.test(r)?!t.disabled:"a"===r?t.href||s:s)&&i(t)}function i(t){return e.expr.filters.visible(t)&&!e(t).parents().addBack().filter(function(){return"hidden"===e.css(this,"visibility")}).length}e.ui=e.ui||{},e.extend(e.ui,{version:"1.11.4",keyCode:{BACKSPACE:8,COMMA:188,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,LEFT:37,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SPACE:32,TAB:9,UP:38}}),e.fn.extend({scrollParent:function(t){var i=this.css("position"),s="absolute"===i,n=t?/(auto|scroll|hidden)/:/(auto|scroll)/,a=this.parents().filter(function(){var t=e(this);return s&&"static"===t.css("position")?!1:n.test(t.css("overflow")+t.css("overflow-y")+t.css("overflow-x"))}).eq(0);return"fixed"!==i&&a.length?a:e(this[0].ownerDocument||document)},uniqueId:function(){var e=0;return function(){return this.each(function(){this.id||(this.id="ui-id-"+ ++e)})}}(),removeUniqueId:function(){return this.each(function(){/^ui-id-\d+$/.test(this.id)&&e(this).removeAttr("id")})}}),e.extend(e.expr[":"],{data:e.expr.createPseudo?e.expr.createPseudo(function(t){return function(i){return!!e.data(i,t)}}):function(t,i,s){return!!e.data(t,s[3])},focusable:function(i){return t(i,!isNaN(e.attr(i,"tabindex")))},tabbable:function(i){var s=e.attr(i,"tabindex"),n=isNaN(s);return(n||s>=0)&&t(i,!n)}}),e("<a>").outerWidth(1).jquery||e.each(["Width","Height"],function(t,i){function s(t,i,s,a){return e.each(n,function(){i-=parseFloat(e.css(t,"padding"+this))||0,s&&(i-=parseFloat(e.css(t,"border"+this+"Width"))||0),a&&(i-=parseFloat(e.css(t,"margin"+this))||0)}),i}var n="Width"===i?["Left","Right"]:["Top","Bottom"],a=i.toLowerCase(),o={innerWidth:e.fn.innerWidth,innerHeight:e.fn.innerHeight,outerWidth:e.fn.outerWidth,outerHeight:e.fn.outerHeight};e.fn["inner"+i]=function(t){return void 0===t?o["inner"+i].call(this):this.each(function(){e(this).css(a,s(this,t)+"px")})},e.fn["outer"+i]=function(t,n){return"number"!=typeof t?o["outer"+i].call(this,t):this.each(function(){e(this).css(a,s(this,t,!0,n)+"px")})}}),e.fn.addBack||(e.fn.addBack=function(e){return this.add(null==e?this.prevObject:this.prevObject.filter(e))}),e("<a>").data("a-b","a").removeData("a-b").data("a-b")&&(e.fn.removeData=function(t){return function(i){return arguments.length?t.call(this,e.camelCase(i)):t.call(this)}}(e.fn.removeData)),e.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase()),e.fn.extend({focus:function(t){return function(i,s){return"number"==typeof i?this.each(function(){var t=this;setTimeout(function(){e(t).focus(),s&&s.call(t)},i)}):t.apply(this,arguments)}}(e.fn.focus),disableSelection:function(){var e="onselectstart"in document.createElement("div")?"selectstart":"mousedown";return function(){return this.bind(e+".ui-disableSelection",function(e){e.preventDefault()})}}(),enableSelection:function(){return this.unbind(".ui-disableSelection")},zIndex:function(t){if(void 0!==t)return this.css("zIndex",t);if(this.length)for(var i,s,n=e(this[0]);n.length&&n[0]!==document;){if(i=n.css("position"),("absolute"===i||"relative"===i||"fixed"===i)&&(s=parseInt(n.css("zIndex"),10),!isNaN(s)&&0!==s))return s;n=n.parent()}return 0}}),e.ui.plugin={add:function(t,i,s){var n,a=e.ui[t].prototype;for(n in s)a.plugins[n]=a.plugins[n]||[],a.plugins[n].push([i,s[n]])},call:function(e,t,i,s){var n,a=e.plugins[t];if(a&&(s||e.element[0].parentNode&&11!==e.element[0].parentNode.nodeType))for(n=0;a.length>n;n++)e.options[a[n][0]]&&a[n][1].apply(e.element,i)}};var s=0,n=Array.prototype.slice;e.cleanData=function(t){return function(i){var s,n,a;for(a=0;null!=(n=i[a]);a++)try{s=e._data(n,"events"),s&&s.remove&&e(n).triggerHandler("remove")}catch(o){}t(i)}}(e.cleanData),e.widget=function(t,i,s){var n,a,o,r,h={},l=t.split(".")[0];return t=t.split(".")[1],n=l+"-"+t,s||(s=i,i=e.Widget),e.expr[":"][n.toLowerCase()]=function(t){return!!e.data(t,n)},e[l]=e[l]||{},a=e[l][t],o=e[l][t]=function(e,t){return this._createWidget?(arguments.length&&this._createWidget(e,t),void 0):new o(e,t)},e.extend(o,a,{version:s.version,_proto:e.extend({},s),_childConstructors:[]}),r=new i,r.options=e.widget.extend({},r.options),e.each(s,function(t,s){return e.isFunction(s)?(h[t]=function(){var e=function(){return i.prototype[t].apply(this,arguments)},n=function(e){return i.prototype[t].apply(this,e)};return function(){var t,i=this._super,a=this._superApply;return this._super=e,this._superApply=n,t=s.apply(this,arguments),this._super=i,this._superApply=a,t}}(),void 0):(h[t]=s,void 0)}),o.prototype=e.widget.extend(r,{widgetEventPrefix:a?r.widgetEventPrefix||t:t},h,{constructor:o,namespace:l,widgetName:t,widgetFullName:n}),a?(e.each(a._childConstructors,function(t,i){var s=i.prototype;e.widget(s.namespace+"."+s.widgetName,o,i._proto)}),delete a._childConstructors):i._childConstructors.push(o),e.widget.bridge(t,o),o},e.widget.extend=function(t){for(var i,s,a=n.call(arguments,1),o=0,r=a.length;r>o;o++)for(i in a[o])s=a[o][i],a[o].hasOwnProperty(i)&&void 0!==s&&(t[i]=e.isPlainObject(s)?e.isPlainObject(t[i])?e.widget.extend({},t[i],s):e.widget.extend({},s):s);return t},e.widget.bridge=function(t,i){var s=i.prototype.widgetFullName||t;e.fn[t]=function(a){var o="string"==typeof a,r=n.call(arguments,1),h=this;return o?this.each(function(){var i,n=e.data(this,s);return"instance"===a?(h=n,!1):n?e.isFunction(n[a])&&"_"!==a.charAt(0)?(i=n[a].apply(n,r),i!==n&&void 0!==i?(h=i&&i.jquery?h.pushStack(i.get()):i,!1):void 0):e.error("no such method '"+a+"' for "+t+" widget instance"):e.error("cannot call methods on "+t+" prior to initialization; "+"attempted to call method '"+a+"'")}):(r.length&&(a=e.widget.extend.apply(null,[a].concat(r))),this.each(function(){var t=e.data(this,s);t?(t.option(a||{}),t._init&&t._init()):e.data(this,s,new i(a,this))})),h}},e.Widget=function(){},e.Widget._childConstructors=[],e.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{disabled:!1,create:null},_createWidget:function(t,i){i=e(i||this.defaultElement||this)[0],this.element=e(i),this.uuid=s++,this.eventNamespace="."+this.widgetName+this.uuid,this.bindings=e(),this.hoverable=e(),this.focusable=e(),i!==this&&(e.data(i,this.widgetFullName,this),this._on(!0,this.element,{remove:function(e){e.target===i&&this.destroy()}}),this.document=e(i.style?i.ownerDocument:i.document||i),this.window=e(this.document[0].defaultView||this.document[0].parentWindow)),this.options=e.widget.extend({},this.options,this._getCreateOptions(),t),this._create(),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:e.noop,_getCreateEventData:e.noop,_create:e.noop,_init:e.noop,destroy:function(){this._destroy(),this.element.unbind(this.eventNamespace).removeData(this.widgetFullName).removeData(e.camelCase(this.widgetFullName)),this.widget().unbind(this.eventNamespace).removeAttr("aria-disabled").removeClass(this.widgetFullName+"-disabled "+"ui-state-disabled"),this.bindings.unbind(this.eventNamespace),this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus")},_destroy:e.noop,widget:function(){return this.element},option:function(t,i){var s,n,a,o=t;if(0===arguments.length)return e.widget.extend({},this.options);if("string"==typeof t)if(o={},s=t.split("."),t=s.shift(),s.length){for(n=o[t]=e.widget.extend({},this.options[t]),a=0;s.length-1>a;a++)n[s[a]]=n[s[a]]||{},n=n[s[a]];if(t=s.pop(),1===arguments.length)return void 0===n[t]?null:n[t];n[t]=i}else{if(1===arguments.length)return void 0===this.options[t]?null:this.options[t];o[t]=i}return this._setOptions(o),this},_setOptions:function(e){var t;for(t in e)this._setOption(t,e[t]);return this},_setOption:function(e,t){return this.options[e]=t,"disabled"===e&&(this.widget().toggleClass(this.widgetFullName+"-disabled",!!t),t&&(this.hoverable.removeClass("ui-state-hover"),this.focusable.removeClass("ui-state-focus"))),this},enable:function(){return this._setOptions({disabled:!1})},disable:function(){return this._setOptions({disabled:!0})},_on:function(t,i,s){var n,a=this;"boolean"!=typeof t&&(s=i,i=t,t=!1),s?(i=n=e(i),this.bindings=this.bindings.add(i)):(s=i,i=this.element,n=this.widget()),e.each(s,function(s,o){function r(){return t||a.options.disabled!==!0&&!e(this).hasClass("ui-state-disabled")?("string"==typeof o?a[o]:o).apply(a,arguments):void 0}"string"!=typeof o&&(r.guid=o.guid=o.guid||r.guid||e.guid++);var h=s.match(/^([\w:-]*)\s*(.*)$/),l=h[1]+a.eventNamespace,u=h[2];u?n.delegate(u,l,r):i.bind(l,r)})},_off:function(t,i){i=(i||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,t.unbind(i).undelegate(i),this.bindings=e(this.bindings.not(t).get()),this.focusable=e(this.focusable.not(t).get()),this.hoverable=e(this.hoverable.not(t).get())},_delay:function(e,t){function i(){return("string"==typeof e?s[e]:e).apply(s,arguments)}var s=this;return setTimeout(i,t||0)},_hoverable:function(t){this.hoverable=this.hoverable.add(t),this._on(t,{mouseenter:function(t){e(t.currentTarget).addClass("ui-state-hover")},mouseleave:function(t){e(t.currentTarget).removeClass("ui-state-hover")}})},_focusable:function(t){this.focusable=this.focusable.add(t),this._on(t,{focusin:function(t){e(t.currentTarget).addClass("ui-state-focus")},focusout:function(t){e(t.currentTarget).removeClass("ui-state-focus")}})},_trigger:function(t,i,s){var n,a,o=this.options[t];if(s=s||{},i=e.Event(i),i.type=(t===this.widgetEventPrefix?t:this.widgetEventPrefix+t).toLowerCase(),i.target=this.element[0],a=i.originalEvent)for(n in a)n in i||(i[n]=a[n]);return this.element.trigger(i,s),!(e.isFunction(o)&&o.apply(this.element[0],[i].concat(s))===!1||i.isDefaultPrevented())}},e.each({show:"fadeIn",hide:"fadeOut"},function(t,i){e.Widget.prototype["_"+t]=function(s,n,a){"string"==typeof n&&(n={effect:n});var o,r=n?n===!0||"number"==typeof n?i:n.effect||i:t;n=n||{},"number"==typeof n&&(n={duration:n}),o=!e.isEmptyObject(n),n.complete=a,n.delay&&s.delay(n.delay),o&&e.effects&&e.effects.effect[r]?s[t](n):r!==t&&s[r]?s[r](n.duration,n.easing,a):s.queue(function(i){e(this)[t](),a&&a.call(s[0]),i()})}}),e.widget;var a=!1;e(document).mouseup(function(){a=!1}),e.widget("ui.mouse",{version:"1.11.4",options:{cancel:"input,textarea,button,select,option",distance:1,delay:0},_mouseInit:function(){var t=this;this.element.bind("mousedown."+this.widgetName,function(e){return t._mouseDown(e)}).bind("click."+this.widgetName,function(i){return!0===e.data(i.target,t.widgetName+".preventClickEvent")?(e.removeData(i.target,t.widgetName+".preventClickEvent"),i.stopImmediatePropagation(),!1):void 0}),this.started=!1},_mouseDestroy:function(){this.element.unbind("."+this.widgetName),this._mouseMoveDelegate&&this.document.unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate)},_mouseDown:function(t){if(!a){this._mouseMoved=!1,this._mouseStarted&&this._mouseUp(t),this._mouseDownEvent=t;var i=this,s=1===t.which,n="string"==typeof this.options.cancel&&t.target.nodeName?e(t.target).closest(this.options.cancel).length:!1;return s&&!n&&this._mouseCapture(t)?(this.mouseDelayMet=!this.options.delay,this.mouseDelayMet||(this._mouseDelayTimer=setTimeout(function(){i.mouseDelayMet=!0},this.options.delay)),this._mouseDistanceMet(t)&&this._mouseDelayMet(t)&&(this._mouseStarted=this._mouseStart(t)!==!1,!this._mouseStarted)?(t.preventDefault(),!0):(!0===e.data(t.target,this.widgetName+".preventClickEvent")&&e.removeData(t.target,this.widgetName+".preventClickEvent"),this._mouseMoveDelegate=function(e){return i._mouseMove(e)},this._mouseUpDelegate=function(e){return i._mouseUp(e)},this.document.bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate),t.preventDefault(),a=!0,!0)):!0}},_mouseMove:function(t){if(this._mouseMoved){if(e.ui.ie&&(!document.documentMode||9>document.documentMode)&&!t.button)return this._mouseUp(t);if(!t.which)return this._mouseUp(t)}return(t.which||t.button)&&(this._mouseMoved=!0),this._mouseStarted?(this._mouseDrag(t),t.preventDefault()):(this._mouseDistanceMet(t)&&this._mouseDelayMet(t)&&(this._mouseStarted=this._mouseStart(this._mouseDownEvent,t)!==!1,this._mouseStarted?this._mouseDrag(t):this._mouseUp(t)),!this._mouseStarted)},_mouseUp:function(t){return this.document.unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate),this._mouseStarted&&(this._mouseStarted=!1,t.target===this._mouseDownEvent.target&&e.data(t.target,this.widgetName+".preventClickEvent",!0),this._mouseStop(t)),a=!1,!1},_mouseDistanceMet:function(e){return Math.max(Math.abs(this._mouseDownEvent.pageX-e.pageX),Math.abs(this._mouseDownEvent.pageY-e.pageY))>=this.options.distance},_mouseDelayMet:function(){return this.mouseDelayMet},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return!0}}),e.widget("ui.slider",e.ui.mouse,{version:"1.11.4",widgetEventPrefix:"slide",options:{animate:!1,distance:0,max:100,min:0,orientation:"horizontal",range:!1,step:1,value:0,values:null,change:null,slide:null,start:null,stop:null},numPages:5,_create:function(){this._keySliding=!1,this._mouseSliding=!1,this._animateOff=!0,this._handleIndex=null,this._detectOrientation(),this._mouseInit(),this._calculateNewMax(),this.element.addClass("ui-slider ui-slider-"+this.orientation+" ui-widget"+" ui-widget-content"+" ui-corner-all"),this._refresh(),this._setOption("disabled",this.options.disabled),this._animateOff=!1},_refresh:function(){this._createRange(),this._createHandles(),this._setupEvents(),this._refreshValue()},_createHandles:function(){var t,i,s=this.options,n=this.element.find(".ui-slider-handle").addClass("ui-state-default ui-corner-all"),a="<span class='ui-slider-handle ui-state-default ui-corner-all' tabindex='0'></span>",o=[];for(i=s.values&&s.values.length||1,n.length>i&&(n.slice(i).remove(),n=n.slice(0,i)),t=n.length;i>t;t++)o.push(a);this.handles=n.add(e(o.join("")).appendTo(this.element)),this.handle=this.handles.eq(0),this.handles.each(function(t){e(this).data("ui-slider-handle-index",t)})},_createRange:function(){var t=this.options,i="";t.range?(t.range===!0&&(t.values?t.values.length&&2!==t.values.length?t.values=[t.values[0],t.values[0]]:e.isArray(t.values)&&(t.values=t.values.slice(0)):t.values=[this._valueMin(),this._valueMin()]),this.range&&this.range.length?this.range.removeClass("ui-slider-range-min ui-slider-range-max").css({left:"",bottom:""}):(this.range=e("<div></div>").appendTo(this.element),i="ui-slider-range ui-widget-header ui-corner-all"),this.range.addClass(i+("min"===t.range||"max"===t.range?" ui-slider-range-"+t.range:""))):(this.range&&this.range.remove(),this.range=null)},_setupEvents:function(){this._off(this.handles),this._on(this.handles,this._handleEvents),this._hoverable(this.handles),this._focusable(this.handles)},_destroy:function(){this.handles.remove(),this.range&&this.range.remove(),this.element.removeClass("ui-slider ui-slider-horizontal ui-slider-vertical ui-widget ui-widget-content ui-corner-all"),this._mouseDestroy()},_mouseCapture:function(t){var i,s,n,a,o,r,h,l,u=this,d=this.options;return d.disabled?!1:(this.elementSize={width:this.element.outerWidth(),height:this.element.outerHeight()},this.elementOffset=this.element.offset(),i={x:t.pageX,y:t.pageY},s=this._normValueFromMouse(i),n=this._valueMax()-this._valueMin()+1,this.handles.each(function(t){var i=Math.abs(s-u.values(t));(n>i||n===i&&(t===u._lastChangedValue||u.values(t)===d.min))&&(n=i,a=e(this),o=t)}),r=this._start(t,o),r===!1?!1:(this._mouseSliding=!0,this._handleIndex=o,a.addClass("ui-state-active").focus(),h=a.offset(),l=!e(t.target).parents().addBack().is(".ui-slider-handle"),this._clickOffset=l?{left:0,top:0}:{left:t.pageX-h.left-a.width()/2,top:t.pageY-h.top-a.height()/2-(parseInt(a.css("borderTopWidth"),10)||0)-(parseInt(a.css("borderBottomWidth"),10)||0)+(parseInt(a.css("marginTop"),10)||0)},this.handles.hasClass("ui-state-hover")||this._slide(t,o,s),this._animateOff=!0,!0))},_mouseStart:function(){return!0},_mouseDrag:function(e){var t={x:e.pageX,y:e.pageY},i=this._normValueFromMouse(t);return this._slide(e,this._handleIndex,i),!1},_mouseStop:function(e){return this.handles.removeClass("ui-state-active"),this._mouseSliding=!1,this._stop(e,this._handleIndex),this._change(e,this._handleIndex),this._handleIndex=null,this._clickOffset=null,this._animateOff=!1,!1},_detectOrientation:function(){this.orientation="vertical"===this.options.orientation?"vertical":"horizontal"},_normValueFromMouse:function(e){var t,i,s,n,a;return"horizontal"===this.orientation?(t=this.elementSize.width,i=e.x-this.elementOffset.left-(this._clickOffset?this._clickOffset.left:0)):(t=this.elementSize.height,i=e.y-this.elementOffset.top-(this._clickOffset?this._clickOffset.top:0)),s=i/t,s>1&&(s=1),0>s&&(s=0),"vertical"===this.orientation&&(s=1-s),n=this._valueMax()-this._valueMin(),a=this._valueMin()+s*n,this._trimAlignValue(a)},_start:function(e,t){var i={handle:this.handles[t],value:this.value()};return this.options.values&&this.options.values.length&&(i.value=this.values(t),i.values=this.values()),this._trigger("start",e,i)},_slide:function(e,t,i){var s,n,a;this.options.values&&this.options.values.length?(s=this.values(t?0:1),2===this.options.values.length&&this.options.range===!0&&(0===t&&i>s||1===t&&s>i)&&(i=s),i!==this.values(t)&&(n=this.values(),n[t]=i,a=this._trigger("slide",e,{handle:this.handles[t],value:i,values:n}),s=this.values(t?0:1),a!==!1&&this.values(t,i))):i!==this.value()&&(a=this._trigger("slide",e,{handle:this.handles[t],value:i}),a!==!1&&this.value(i))},_stop:function(e,t){var i={handle:this.handles[t],value:this.value()};this.options.values&&this.options.values.length&&(i.value=this.values(t),i.values=this.values()),this._trigger("stop",e,i)},_change:function(e,t){if(!this._keySliding&&!this._mouseSliding){var i={handle:this.handles[t],value:this.value()};this.options.values&&this.options.values.length&&(i.value=this.values(t),i.values=this.values()),this._lastChangedValue=t,this._trigger("change",e,i)}},value:function(e){return arguments.length?(this.options.value=this._trimAlignValue(e),this._refreshValue(),this._change(null,0),void 0):this._value()},values:function(t,i){var s,n,a;if(arguments.length>1)return this.options.values[t]=this._trimAlignValue(i),this._refreshValue(),this._change(null,t),void 0;if(!arguments.length)return this._values();if(!e.isArray(arguments[0]))return this.options.values&&this.options.values.length?this._values(t):this.value();for(s=this.options.values,n=arguments[0],a=0;s.length>a;a+=1)s[a]=this._trimAlignValue(n[a]),this._change(null,a);this._refreshValue()},_setOption:function(t,i){var s,n=0;switch("range"===t&&this.options.range===!0&&("min"===i?(this.options.value=this._values(0),this.options.values=null):"max"===i&&(this.options.value=this._values(this.options.values.length-1),this.options.values=null)),e.isArray(this.options.values)&&(n=this.options.values.length),"disabled"===t&&this.element.toggleClass("ui-state-disabled",!!i),this._super(t,i),t){case"orientation":this._detectOrientation(),this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-"+this.orientation),this._refreshValue(),this.handles.css("horizontal"===i?"bottom":"left","");break;case"value":this._animateOff=!0,this._refreshValue(),this._change(null,0),this._animateOff=!1;break;case"values":for(this._animateOff=!0,this._refreshValue(),s=0;n>s;s+=1)this._change(null,s);this._animateOff=!1;break;case"step":case"min":case"max":this._animateOff=!0,this._calculateNewMax(),this._refreshValue(),this._animateOff=!1;break;case"range":this._animateOff=!0,this._refresh(),this._animateOff=!1}},_value:function(){var e=this.options.value;return e=this._trimAlignValue(e)},_values:function(e){var t,i,s;if(arguments.length)return t=this.options.values[e],t=this._trimAlignValue(t);if(this.options.values&&this.options.values.length){for(i=this.options.values.slice(),s=0;i.length>s;s+=1)i[s]=this._trimAlignValue(i[s]);return i}return[]},_trimAlignValue:function(e){if(this._valueMin()>=e)return this._valueMin();if(e>=this._valueMax())return this._valueMax();var t=this.options.step>0?this.options.step:1,i=(e-this._valueMin())%t,s=e-i;return 2*Math.abs(i)>=t&&(s+=i>0?t:-t),parseFloat(s.toFixed(5))},_calculateNewMax:function(){var e=this.options.max,t=this._valueMin(),i=this.options.step,s=Math.floor(+(e-t).toFixed(this._precision())/i)*i;e=s+t,this.max=parseFloat(e.toFixed(this._precision()))},_precision:function(){var e=this._precisionOf(this.options.step);return null!==this.options.min&&(e=Math.max(e,this._precisionOf(this.options.min))),e},_precisionOf:function(e){var t=""+e,i=t.indexOf(".");return-1===i?0:t.length-i-1},_valueMin:function(){return this.options.min},_valueMax:function(){return this.max},_refreshValue:function(){var t,i,s,n,a,o=this.options.range,r=this.options,h=this,l=this._animateOff?!1:r.animate,u={};this.options.values&&this.options.values.length?this.handles.each(function(s){i=100*((h.values(s)-h._valueMin())/(h._valueMax()-h._valueMin())),u["horizontal"===h.orientation?"left":"bottom"]=i+"%",e(this).stop(1,1)[l?"animate":"css"](u,r.animate),h.options.range===!0&&("horizontal"===h.orientation?(0===s&&h.range.stop(1,1)[l?"animate":"css"]({left:i+"%"},r.animate),1===s&&h.range[l?"animate":"css"]({width:i-t+"%"},{queue:!1,duration:r.animate})):(0===s&&h.range.stop(1,1)[l?"animate":"css"]({bottom:i+"%"},r.animate),1===s&&h.range[l?"animate":"css"]({height:i-t+"%"},{queue:!1,duration:r.animate}))),t=i}):(s=this.value(),n=this._valueMin(),a=this._valueMax(),i=a!==n?100*((s-n)/(a-n)):0,u["horizontal"===this.orientation?"left":"bottom"]=i+"%",this.handle.stop(1,1)[l?"animate":"css"](u,r.animate),"min"===o&&"horizontal"===this.orientation&&this.range.stop(1,1)[l?"animate":"css"]({width:i+"%"},r.animate),"max"===o&&"horizontal"===this.orientation&&this.range[l?"animate":"css"]({width:100-i+"%"},{queue:!1,duration:r.animate}),"min"===o&&"vertical"===this.orientation&&this.range.stop(1,1)[l?"animate":"css"]({height:i+"%"},r.animate),"max"===o&&"vertical"===this.orientation&&this.range[l?"animate":"css"]({height:100-i+"%"},{queue:!1,duration:r.animate}))},_handleEvents:{keydown:function(t){var i,s,n,a,o=e(t.target).data("ui-slider-handle-index");switch(t.keyCode){case e.ui.keyCode.HOME:case e.ui.keyCode.END:case e.ui.keyCode.PAGE_UP:case e.ui.keyCode.PAGE_DOWN:case e.ui.keyCode.UP:case e.ui.keyCode.RIGHT:case e.ui.keyCode.DOWN:case e.ui.keyCode.LEFT:if(t.preventDefault(),!this._keySliding&&(this._keySliding=!0,e(t.target).addClass("ui-state-active"),i=this._start(t,o),i===!1))return}switch(a=this.options.step,s=n=this.options.values&&this.options.values.length?this.values(o):this.value(),t.keyCode){case e.ui.keyCode.HOME:n=this._valueMin();break;case e.ui.keyCode.END:n=this._valueMax();break;case e.ui.keyCode.PAGE_UP:n=this._trimAlignValue(s+(this._valueMax()-this._valueMin())/this.numPages);break;case e.ui.keyCode.PAGE_DOWN:n=this._trimAlignValue(s-(this._valueMax()-this._valueMin())/this.numPages);break;case e.ui.keyCode.UP:case e.ui.keyCode.RIGHT:if(s===this._valueMax())return;n=this._trimAlignValue(s+a);break;case e.ui.keyCode.DOWN:case e.ui.keyCode.LEFT:if(s===this._valueMin())return;n=this._trimAlignValue(s-a)}this._slide(t,o,n)},keyup:function(t){var i=e(t.target).data("ui-slider-handle-index");this._keySliding&&(this._keySliding=!1,this._stop(t,i),this._change(t,i),e(t.target).removeClass("ui-state-active"))}}})});

																					
/**
 * jQuery UI Slider
 */
if( typeof MFP_RTL != 'undefined' && MFP_RTL === true ) {
	(function($,g){var h=5;$.widget("ui.slider",$.ui.mouse,{widgetEventPrefix:"slide",options:{animate:false,distance:0,max:100,min:0,orientation:"horizontal",isRTL:false,range:false,step:1,value:0,values:null},_create:function(){var f=this,o=this.options;this._keySliding=false;this._mouseSliding=false;this._animateOff=true;this._handleIndex=null;this._detectOrientation();this._mouseInit();this.element.addClass("ui-slider"+" ui-slider-"+this.orientation+(o.isRTL?" ui-slider-rtl":"")+" ui-widget"+" ui-widget-content"+" ui-corner-all");if(o.disabled){this.element.addClass("ui-slider-disabled ui-disabled")}this.range=$([]);if(o.range){if(o.range===true){this.range=$("<div></div>");if(!o.values){o.values=[this._valueMin(),this._valueMin()]}if(o.values.length&&o.values.length!==2){o.values=[o.values[0],o.values[0]]}}else{this.range=$("<div></div>")}this.range.appendTo(this.element).addClass("ui-slider-range");if(o.range==="min"||o.range==="max"){this.range.addClass("ui-slider-range-"+o.range)}this.range.addClass("ui-widget-header")}if($(".ui-slider-handle",this.element).length===0){$("<a href='#'></a>").appendTo(this.element).addClass("ui-slider-handle")}if(o.values&&o.values.length){while($(".ui-slider-handle",this.element).length<o.values.length){$("<a href='#'></a>").appendTo(this.element).addClass("ui-slider-handle")}}this.handles=$(".ui-slider-handle",this.element).addClass("ui-state-default"+" ui-corner-all");this.handle=this.handles.eq(0);this.handles.add(this.range).filter("a").click(function(a){a.preventDefault()}).hover(function(){if(!o.disabled){$(this).addClass("ui-state-hover")}},function(){$(this).removeClass("ui-state-hover")}).focus(function(){if(!o.disabled){$(".ui-slider .ui-state-focus").removeClass("ui-state-focus");$(this).addClass("ui-state-focus")}else{$(this).blur()}}).blur(function(){$(this).removeClass("ui-state-focus")});this.handles.each(function(i){$(this).data("index.ui-slider-handle",i)});this.handles.keydown(function(c){var d=true,index=$(this).data("index.ui-slider-handle"),allowed,curVal,newVal,step;if(f.options.disabled){return}switch(c.keyCode){case $.ui.keyCode.HOME:case $.ui.keyCode.END:case $.ui.keyCode.PAGE_UP:case $.ui.keyCode.PAGE_DOWN:case $.ui.keyCode.UP:case $.ui.keyCode.RIGHT:case $.ui.keyCode.DOWN:case $.ui.keyCode.LEFT:d=false;if(!f._keySliding){f._keySliding=true;$(this).addClass("ui-state-active");allowed=f._start(c,index);if(allowed===false){return}}break}step=f.options.step;if(f.options.values&&f.options.values.length){curVal=newVal=f.values(index)}else{curVal=newVal=f.value()}var e=function(a,b){if(curVal===a){return}newVal=f._trimAlignValue(curVal+b)};switch(c.keyCode){case $.ui.keyCode.HOME:newVal=f._valueMin();break;case $.ui.keyCode.END:newVal=f._valueMax();break;case $.ui.keyCode.PAGE_UP:newVal=f._trimAlignValue(curVal+((f._valueMax()-f._valueMin())/h));break;case $.ui.keyCode.PAGE_DOWN:newVal=f._trimAlignValue(curVal-((f._valueMax()-f._valueMin())/h));break;case $.ui.keyCode.UP:e(f._valueMax(),step);break;case $.ui.keyCode.RIGHT:e(f._valueMax(),f.options.isRTL?-step:step);break;case $.ui.keyCode.DOWN:e(f._valueMin(),-step);break;case $.ui.keyCode.LEFT:e(f._valueMin(),f.options.isRTL?step:-step);break}f._slide(c,index,newVal);return d}).keyup(function(a){var b=$(this).data("index.ui-slider-handle");if(f._keySliding){f._keySliding=false;f._stop(a,b);f._change(a,b);$(this).removeClass("ui-state-active")}});this._refreshValue();this._animateOff=false},destroy:function(){this.handles.remove();this.range.remove();this.element.removeClass("ui-slider"+" ui-slider-horizontal"+" ui-slider-vertical"+" ui-slider-disabled"+" ui-widget"+" ui-widget-content"+" ui-corner-all").removeData("slider").unbind(".slider");this._mouseDestroy();return this},_mouseCapture:function(b){var o=this.options,position,normValue,distance,closestHandle,self,index,allowed,offset,mouseOverHandle;if(o.disabled){return false}this.elementSize={width:this.element.outerWidth(),height:this.element.outerHeight()};this.elementOffset=this.element.offset();position={x:b.pageX,y:b.pageY};normValue=this._normValueFromMouse(position);distance=this._valueMax()-this._valueMin()+1;self=this;this.handles.each(function(i){var a=Math.abs(normValue-self.values(i));if(distance>a){distance=a;closestHandle=$(this);index=i}});if(o.range===true&&this.values(1)===o.min){index+=1;closestHandle=$(this.handles[index])}allowed=this._start(b,index);if(allowed===false){return false}this._mouseSliding=true;self._handleIndex=index;closestHandle.addClass("ui-state-active").focus();offset=closestHandle.offset();mouseOverHandle=!$(b.target).parents().andSelf().is(".ui-slider-handle");this._clickOffset=mouseOverHandle?{left:0,top:0}:{left:b.pageX-offset.left-(closestHandle.width()/2),top:b.pageY-offset.top-(closestHandle.height()/2)-(parseInt(closestHandle.css("borderTopWidth"),10)||0)-(parseInt(closestHandle.css("borderBottomWidth"),10)||0)+(parseInt(closestHandle.css("marginTop"),10)||0)};if(!this.handles.hasClass("ui-state-hover")){this._slide(b,index,normValue)}this._animateOff=true;return true},_mouseStart:function(a){return true},_mouseDrag:function(a){var b={x:a.pageX,y:a.pageY},normValue=this._normValueFromMouse(b);this._slide(a,this._handleIndex,normValue);return false},_mouseStop:function(a){this.handles.removeClass("ui-state-active");this._mouseSliding=false;this._stop(a,this._handleIndex);this._change(a,this._handleIndex);this._handleIndex=null;this._clickOffset=null;this._animateOff=false;return false},_detectOrientation:function(){this.orientation=(this.options.orientation==="vertical")?"vertical":"horizontal"},_normValueFromMouse:function(a){var b,pixelMouse,percentMouse,valueTotal,valueMouse;if(this.orientation==="horizontal"){b=this.elementSize.width;pixelMouse=a.x-this.elementOffset.left-(this._clickOffset?this._clickOffset.left:0)}else{b=this.elementSize.height;pixelMouse=a.y-this.elementOffset.top-(this._clickOffset?this._clickOffset.top:0)}percentMouse=(pixelMouse/b);if(percentMouse>1){percentMouse=1}if(percentMouse<0){percentMouse=0}if(this.orientation==="vertical"){percentMouse=1-percentMouse}if(this.options.isRTL){percentMouse=1-percentMouse}valueTotal=this._valueMax()-this._valueMin();valueMouse=this._valueMin()+percentMouse*valueTotal;return this._trimAlignValue(valueMouse)},_start:function(a,b){var c={handle:this.handles[b],value:this.value()};if(this.options.values&&this.options.values.length){c.value=this.values(b);c.values=this.values()}return this._trigger("start",a,c)},_slide:function(a,b,c){var d,newValues,allowed;if(this.options.values&&this.options.values.length){d=this.values(b?0:1);if((this.options.values.length===2&&this.options.range===true)&&((b===0&&c>d)||(b===1&&c<d))){c=d}if(c!==this.values(b)){newValues=this.values();newValues[b]=c;allowed=this._trigger("slide",a,{handle:this.handles[b],value:c,values:newValues});d=this.values(b?0:1);if(allowed!==false){this.values(b,c,true)}}}else{if(c!==this.value()){allowed=this._trigger("slide",a,{handle:this.handles[b],value:c});if(allowed!==false){this.value(c)}}}},_stop:function(a,b){var c={handle:this.handles[b],value:this.value()};if(this.options.values&&this.options.values.length){c.value=this.values(b);c.values=this.values()}this._trigger("stop",a,c)},_change:function(a,b){if(!this._keySliding&&!this._mouseSliding){var c={handle:this.handles[b],value:this.value()};if(this.options.values&&this.options.values.length){c.value=this.values(b);c.values=this.values()}this._trigger("change",a,c)}},value:function(a){if(arguments.length){this.options.value=this._trimAlignValue(a);this._refreshValue();this._change(null,0)}return this._value()},values:function(a,b){var c,newValues,i;if(arguments.length>1){this.options.values[a]=this._trimAlignValue(b);this._refreshValue();this._change(null,a)}if(arguments.length){if($.isArray(arguments[0])){c=this.options.values;newValues=arguments[0];for(i=0;i<c.length;i+=1){c[i]=this._trimAlignValue(newValues[i]);this._change(null,i)}this._refreshValue()}else{if(this.options.values&&this.options.values.length){return this._values(a)}else{return this.value()}}}else{return this._values()}},_setOption:function(a,b){var i,valsLength=0;if($.isArray(this.options.values)){valsLength=this.options.values.length}$.Widget.prototype._setOption.apply(this,arguments);switch(a){case"disabled":if(b){this.handles.filter(".ui-state-focus").blur();this.handles.removeClass("ui-state-hover");this.handles.attr("disabled","disabled");this.element.addClass("ui-disabled")}else{this.handles.removeAttr("disabled");this.element.removeClass("ui-disabled")}break;case"orientation":this._detectOrientation();this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-"+this.orientation);this._refreshValue();break;case"isRTL":this.element.toggleClass("ui-slider-rtl",b);this._refreshValue();break;case"value":this._animateOff=true;this._refreshValue();this._change(null,0);this._animateOff=false;break;case"values":this._animateOff=true;this._refreshValue();for(i=0;i<valsLength;i+=1){this._change(null,i)}this._animateOff=false;break}},_value:function(){var a=this.options.value;a=this._trimAlignValue(a);return a},_values:function(a){var b,vals,i;if(arguments.length){b=this.options.values[a];b=this._trimAlignValue(b);return b}else{vals=this.options.values.slice();for(i=0;i<vals.length;i+=1){vals[i]=this._trimAlignValue(vals[i])}return vals}},_trimAlignValue:function(a){if(a<=this._valueMin()){return this._valueMin()}if(a>=this._valueMax()){return this._valueMax()}var b=(this.options.step>0)?this.options.step:1,valModStep=(a-this._valueMin())%b;alignValue=a-valModStep;if(Math.abs(valModStep)*2>=b){alignValue+=(valModStep>0)?b:(-b)}return parseFloat(alignValue.toFixed(5))},_valueMin:function(){return this.options.min},_valueMax:function(){return this.options.max},_refreshValue:function(){var a=this.options.range,o=this.options,self=this,animate=(!this._animateOff)?o.animate:false,valPercent,_set={},lastValPercent,value,valueMin,valueMax;if(this.options.values&&this.options.values.length){this.handles.each(function(i,j){valPercent=(self.values(i)-self._valueMin())/(self._valueMax()-self._valueMin())*100;valPercent=(self.options.isRTL?100-valPercent:valPercent);_set[self.orientation==="horizontal"?"left":"bottom"]=valPercent+"%";$(this).stop(1,1)[animate?"animate":"css"](_set,o.animate);if(self.options.range===true){if(self.orientation==="horizontal"){if(i===0){self.range.stop(1,1)[animate?"animate":"css"](self.options.isRTL?{right:(100-valPercent)+"%"}:{left:valPercent+"%"},o.animate)}if(i===1){self.range[animate?"animate":"css"]({width:((self.options.isRTL?-1:+1)*(valPercent-lastValPercent))+"%"},{queue:false,duration:o.animate})}}else{if(i===0){self.range.stop(1,1)[animate?"animate":"css"](self.options.isRTL?{top:(100-valPercent)+"%"}:{bottom:(valPercent)+"%"},o.animate)}if(i===1){self.range[animate?"animate":"css"]({height:((self.options.isRTL?-1:+1)*(valPercent-lastValPercent))+"%"},{queue:false,duration:o.animate})}}}lastValPercent=valPercent})}else{value=this.value();valueMin=this._valueMin();valueMax=this._valueMax();valPercent=(valueMax!==valueMin)?(value-valueMin)/(valueMax-valueMin)*100:0;valPercent=(self.options.isRTL?100-valPercent:valPercent);_set[self.orientation==="horizontal"?"left":"bottom"]=valPercent+"%";this.handle.stop(1,1)[animate?"animate":"css"](_set,o.animate);if(a==="min"&&this.orientation==="horizontal"){this.range.stop(1,1)[animate?"animate":"css"]({width:(self.options.isRTL?100-valPercent:valPercent)+"%"},o.animate)}if(a==="max"&&this.orientation==="horizontal"){this.range[animate?"animate":"css"]({width:(self.options.isRTL?valPercent:100-valPercent)+"%"},{queue:false,duration:o.animate})}if(a==="min"&&this.orientation==="vertical"){this.range.stop(1,1)[animate?"animate":"css"]({height:(self.options.isRTL?100-valPercent:valPercent)+"%"},o.animate)}if(a==="max"&&this.orientation==="vertical"){this.range[animate?"animate":"css"]({height:(self.options.isRTL?valPercent:100-valPercent)+"%"},{queue:false,duration:o.animate})}}}});$.extend($.ui.slider,{version:"1.8.9"})}(jQuery));
}
/*!
 * jQuery UI Touch Punch 0.2.3
 *
 * Copyright 2011–2014, Dave Furfero
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 * Depends:
 *  jquery.ui.widget.js
 *  jquery.ui.mouse.js
 */
(function ($) {

  // Detect touch support
  $.support.touch = 'ontouchend' in document;

  // Ignore browsers without touch support
  if (!$.support.touch) {
    return;
  }

  var mouseProto = $.ui.mouse.prototype,
      _mouseInit = mouseProto._mouseInit,
      _mouseDestroy = mouseProto._mouseDestroy,
      touchHandled;

  /**
   * Simulate a mouse event based on a corresponding touch event
   * @param {Object} event A touch event
   * @param {String} simulatedType The corresponding mouse event
   */
  function simulateMouseEvent (event, simulatedType) {

    // Ignore multi-touch events
    if (event.originalEvent.touches.length > 1) {
      return;
    }

    event.preventDefault();

    var touch = event.originalEvent.changedTouches[0],
        simulatedEvent = document.createEvent('MouseEvents');
    
    // Initialize the simulated mouse event using the touch event's coordinates
    simulatedEvent.initMouseEvent(
      simulatedType,    // type
      true,             // bubbles                    
      true,             // cancelable                 
      window,           // view                       
      1,                // detail                     
      touch.screenX,    // screenX                    
      touch.screenY,    // screenY                    
      touch.clientX,    // clientX                    
      touch.clientY,    // clientY                    
      false,            // ctrlKey                    
      false,            // altKey                     
      false,            // shiftKey                   
      false,            // metaKey                    
      0,                // button                     
      null              // relatedTarget              
    );

    // Dispatch the simulated event to the target element
    event.target.dispatchEvent(simulatedEvent);
  }

  /**
   * Handle the jQuery UI widget's touchstart events
   * @param {Object} event The widget element's touchstart event
   */
  mouseProto._touchStart = function (event) {

    var self = this;

    // Ignore the event if another widget is already being handled
    if (touchHandled || !self._mouseCapture(event.originalEvent.changedTouches[0])) {
      return;
    }

    // Set the flag to prevent other widgets from inheriting the touch event
    touchHandled = true;

    // Track movement to determine if interaction was a click
    self._touchMoved = false;

    // Simulate the mouseover event
    simulateMouseEvent(event, 'mouseover');

    // Simulate the mousemove event
    simulateMouseEvent(event, 'mousemove');

    // Simulate the mousedown event
    simulateMouseEvent(event, 'mousedown');
  };

  /**
   * Handle the jQuery UI widget's touchmove events
   * @param {Object} event The document's touchmove event
   */
  mouseProto._touchMove = function (event) {

    // Ignore event if not handled
    if (!touchHandled) {
      return;
    }

    // Interaction was not a click
    this._touchMoved = true;

    // Simulate the mousemove event
    simulateMouseEvent(event, 'mousemove');
  };

  /**
   * Handle the jQuery UI widget's touchend events
   * @param {Object} event The document's touchend event
   */
  mouseProto._touchEnd = function (event) {

    // Ignore event if not handled
    if (!touchHandled) {
      return;
    }

    // Simulate the mouseup event
    simulateMouseEvent(event, 'mouseup');

    // Simulate the mouseout event
    simulateMouseEvent(event, 'mouseout');

    // If the touch interaction did not move, it should trigger a click
    if (!this._touchMoved) {

      // Simulate the click event
      simulateMouseEvent(event, 'click');
    }

    // Unset the flag to allow other widgets to inherit the touch event
    touchHandled = false;
  };

  /**
   * A duck punch of the $.ui.mouse _mouseInit method to support touch events.
   * This method extends the widget with bound touch event handlers that
   * translate touch events to mouse events and pass them to the widget's
   * original mouse event handling methods.
   */
  mouseProto._mouseInit = function () {
    
    var self = this;

    // Delegate the touch handlers to the widget's element
    self.element.bind({
      touchstart: $.proxy(self, '_touchStart'),
      touchmove: $.proxy(self, '_touchMove'),
      touchend: $.proxy(self, '_touchEnd')
    });

    // Call the original $.ui.mouse init method
    _mouseInit.call(self);
  };

  /**
   * Remove the touch event handlers
   */
  mouseProto._mouseDestroy = function () {
    
    var self = this;

    // Delegate the touch handlers to the widget's element
    self.element.unbind({
      touchstart: $.proxy(self, '_touchStart'),
      touchmove: $.proxy(self, '_touchMove'),
      touchend: $.proxy(self, '_touchEnd')
    });

    // Call the original $.ui.mouse destroy method
    _mouseDestroy.call(self);
  };

})(jQuery);

////////////////////////////////////////////////////////////////////////////////

/*! Copyright 2012, Ben Lin (http://dreamerslab.com/)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version: 1.0.16
 *
 * Requires: jQuery >= 1.2.3
 */
( function ( $ ){
  $.fn.addBack = $.fn.addBack || $.fn.andSelf;

  $.fn.extend({

    actual : function ( method, options ){
      // check if the jQuery method exist
      if( !this[ method ]){
        throw '$.actual => The jQuery method "' + method + '" you called does not exist';
      }

      var defaults = {
        absolute      : false,
        clone         : false,
        includeMargin : false
      };

      var configs = $.extend( defaults, options );

      var $target = this.eq( 0 );
      var fix, restore;

      if( configs.clone === true ){
        fix = function (){
          var style = 'position: absolute !important; top: -1000 !important; ';

          // this is useful with css3pie
          $target = $target.
            clone().
            attr( 'style', style ).
            appendTo( 'body' );
        };

        restore = function (){
          // remove DOM element after getting the width
          $target.remove();
        };
      }else{
        var tmp   = [];
        var style = '';
        var $hidden;

        fix = function (){
          // get all hidden parents
          $hidden = $target.parents().addBack().filter( ':hidden' );
          style   += 'visibility: hidden !important; display: block !important; ';

          if( configs.absolute === true ) style += 'position: absolute !important; ';

          // save the origin style props
          // set the hidden el css to be got the actual value later
          $hidden.each( function (){
            // Save original style. If no style was set, attr() returns undefined
            var $this     = $( this );
            var thisStyle = $this.attr( 'style' );

            tmp.push( thisStyle );
            // Retain as much of the original style as possible, if there is one
            $this.attr( 'style', thisStyle ? thisStyle + ';' + style : style );
          });
        };

        restore = function (){
          // restore origin style values
          $hidden.each( function ( i ){
            var $this = $( this );
            var _tmp  = tmp[ i ];

            if( _tmp === undefined ){
              $this.removeAttr( 'style' );
            }else{
              $this.attr( 'style', _tmp );
            }
          });
        };
      }

      fix();
      // get the actual value with user specific methed
      // it can be 'width', 'height', 'outerWidth', 'innerWidth'... etc
      // configs.includeMargin only works for 'outerWidth' and 'outerHeight'
      var actual = /(outer)/.test( method ) ?
        $target[ method ]( configs.includeMargin ) :
        $target[ method ]();

      restore();
      // IMPORTANT, this plugin only return the value of the first element
      return actual;
    }
  });
})( jQuery );


/*!
 * @fileOverview TouchSwipe - jQuery Plugin
 * @version 1.6.18
 *
 * @author Matt Bryson http://www.github.com/mattbryson
 * @see https://github.com/mattbryson/TouchSwipe-Jquery-Plugin
 * @see http://labs.rampinteractive.co.uk/touchSwipe/
 * @see http://plugins.jquery.com/project/touchSwipe
 * @license
 * Copyright (c) 2010-2015 Matt Bryson
 * Dual licensed under the MIT or GPL Version 2 licenses.
 *
 */
(function(a){if(typeof define==="function"&&define.amd&&define.amd.jQuery){define(["jquery"],a)}else{if(typeof module!=="undefined"&&module.exports){a(require("jquery"))}else{a(jQuery)}}}(function(f){var y="1.6.18",p="left",o="right",e="up",x="down",c="in",A="out",m="none",s="auto",l="swipe",t="pinch",B="tap",j="doubletap",b="longtap",z="hold",E="horizontal",u="vertical",i="all",r=10,g="start",k="move",h="end",q="cancel",a="ontouchstart" in window,v=window.navigator.msPointerEnabled&&!window.navigator.pointerEnabled&&!a,d=(window.navigator.pointerEnabled||window.navigator.msPointerEnabled)&&!a,C="TouchSwipe";var n={fingers:1,threshold:75,cancelThreshold:null,pinchThreshold:20,maxTimeThreshold:null,fingerReleaseThreshold:250,longTapThreshold:500,doubleTapThreshold:200,swipe:null,swipeLeft:null,swipeRight:null,swipeUp:null,swipeDown:null,swipeStatus:null,pinchIn:null,pinchOut:null,pinchStatus:null,click:null,tap:null,doubleTap:null,longTap:null,hold:null,triggerOnTouchEnd:true,triggerOnTouchLeave:false,allowPageScroll:"auto",fallbackToMouseEvents:true,excludedElements:".noSwipe",preventDefaultEvents:true};f.fn.mf_swipe=function(H){var G=f(this),F=G.data(C);if(F&&typeof H==="string"){if(F[H]){return F[H].apply(F,Array.prototype.slice.call(arguments,1))}else{f.error("Method "+H+" does not exist on jQuery.swipe")}}else{if(F&&typeof H==="object"){F.option.apply(F,arguments)}else{if(!F&&(typeof H==="object"||!H)){return w.apply(this,arguments)}}}return G};f.fn.mf_swipe.version=y;f.fn.mf_swipe.defaults=n;f.fn.mf_swipe.phases={PHASE_START:g,PHASE_MOVE:k,PHASE_END:h,PHASE_CANCEL:q};f.fn.mf_swipe.directions={LEFT:p,RIGHT:o,UP:e,DOWN:x,IN:c,OUT:A};f.fn.mf_swipe.pageScroll={NONE:m,HORIZONTAL:E,VERTICAL:u,AUTO:s};f.fn.mf_swipe.fingers={ONE:1,TWO:2,THREE:3,FOUR:4,FIVE:5,ALL:i};function w(F){if(F&&(F.allowPageScroll===undefined&&(F.swipe!==undefined||F.swipeStatus!==undefined))){F.allowPageScroll=m}if(F.click!==undefined&&F.tap===undefined){F.tap=F.click}if(!F){F={}}F=f.extend({},f.fn.mf_swipe.defaults,F);return this.each(function(){var H=f(this);var G=H.data(C);if(!G){G=new D(this,F);H.data(C,G)}})}function D(a6,au){var au=f.extend({},au);var az=(a||d||!au.fallbackToMouseEvents),K=az?(d?(v?"MSPointerDown":"pointerdown"):"touchstart"):"mousedown",ax=az?(d?(v?"MSPointerMove":"pointermove"):"touchmove"):"mousemove",V=az?(d?(v?"MSPointerUp":"pointerup"):"touchend"):"mouseup",T=az?(d?"mouseleave":null):"mouseleave",aD=(d?(v?"MSPointerCancel":"pointercancel"):"touchcancel");var ag=0,aP=null,a3=null,ac=0,a2=0,a0=0,H=1,ap=0,aJ=0,N=null;var aR=f(a6);var aa="start";var X=0;var aQ={};var U=0,a4=0,a7=0,ay=0,O=0;var aX=null,af=null;try{aR.bind(K,aN);aR.bind(aD,bb)}catch(aj){f.error("events not supported "+K+","+aD+" on jQuery.swipe")}this.enable=function(){this.disable();aR.bind(K,aN);aR.bind(aD,bb);return aR};this.disable=function(){aK();return aR};this.destroy=function(){aK();aR.data(C,null);aR=null};this.option=function(be,bd){if(typeof be==="object"){au=f.extend(au,be)}else{if(au[be]!==undefined){if(bd===undefined){return au[be]}else{au[be]=bd}}else{if(!be){return au}else{f.error("Option "+be+" does not exist on jQuery.swipe.options")}}}return null};function aN(bf){if(aB()){return}if(f(bf.target).closest(au.excludedElements,aR).length>0){return}var bg=bf.originalEvent?bf.originalEvent:bf;if(bg.pointerType&&bg.pointerType=="mouse"&&au.fallbackToMouseEvents==false){return}var be,bh=bg.touches,bd=bh?bh[0]:bg;aa=g;if(bh){X=bh.length}else{if(au.preventDefaultEvents!==false){bf.preventDefault()}}ag=0;aP=null;a3=null;aJ=null;ac=0;a2=0;a0=0;H=1;ap=0;N=ab();S();ai(0,bd);if(!bh||(X===au.fingers||au.fingers===i)||aY()){U=ar();if(X==2){ai(1,bh[1]);a2=a0=at(aQ[0].start,aQ[1].start)}if(au.swipeStatus||au.pinchStatus){be=P(bg,aa)}}else{be=false}if(be===false){aa=q;P(bg,aa);return be}else{if(au.hold){af=setTimeout(f.proxy(function(){aR.trigger("hold",[bg.target]);if(au.hold){be=au.hold.call(aR,bg,bg.target)}},this),au.longTapThreshold)}an(true)}return null}function a5(bg){var bj=bg.originalEvent?bg.originalEvent:bg;if(aa===h||aa===q||al()){return}var bf,bk=bj.touches,be=bk?bk[0]:bj;var bh=aH(be);a4=ar();if(bk){X=bk.length}if(au.hold){clearTimeout(af)}aa=k;if(X==2){if(a2==0){ai(1,bk[1]);a2=a0=at(aQ[0].start,aQ[1].start)}else{aH(bk[1]);a0=at(aQ[0].end,aQ[1].end);aJ=aq(aQ[0].end,aQ[1].end)}H=a9(a2,a0);ap=Math.abs(a2-a0)}if((X===au.fingers||au.fingers===i)||!bk||aY()){aP=aL(bh.start,bh.end);a3=aL(bh.last,bh.end);ak(bg,a3);ag=aS(bh.start,bh.end);ac=aM();aI(aP,ag);bf=P(bj,aa);if(!au.triggerOnTouchEnd||au.triggerOnTouchLeave){var bd=true;if(au.triggerOnTouchLeave){var bi=aZ(this);bd=F(bh.end,bi)}if(!au.triggerOnTouchEnd&&bd){aa=aC(k)}else{if(au.triggerOnTouchLeave&&!bd){aa=aC(h)}}if(aa==q||aa==h){P(bj,aa)}}}else{aa=q;P(bj,aa)}if(bf===false){aa=q;P(bj,aa)}}function M(bd){var be=bd.originalEvent?bd.originalEvent:bd,bf=be.touches;if(bf){if(bf.length&&!al()){G(be);return true}else{if(bf.length&&al()){return true}}}if(al()){X=ay}a4=ar();ac=aM();if(bc()||!am()){aa=q;P(be,aa)}else{if(au.triggerOnTouchEnd||(au.triggerOnTouchEnd===false&&aa===k)){if(au.preventDefaultEvents!==false&&bd.cancelable!==false){bd.preventDefault()}aa=h;P(be,aa)}else{if(!au.triggerOnTouchEnd&&a8()){aa=h;aF(be,aa,B)}else{if(aa===k){aa=q;P(be,aa)}}}}an(false);return null}function bb(){X=0;a4=0;U=0;a2=0;a0=0;H=1;S();an(false)}function L(bd){var be=bd.originalEvent?bd.originalEvent:bd;if(au.triggerOnTouchLeave){aa=aC(h);P(be,aa)}}function aK(){aR.unbind(K,aN);aR.unbind(aD,bb);aR.unbind(ax,a5);aR.unbind(V,M);if(T){aR.unbind(T,L)}an(false)}function aC(bh){var bg=bh;var bf=aA();var be=am();var bd=bc();if(!bf||bd){bg=q}else{if(be&&bh==k&&(!au.triggerOnTouchEnd||au.triggerOnTouchLeave)){bg=h}else{if(!be&&bh==h&&au.triggerOnTouchLeave){bg=q}}}return bg}function P(bf,bd){var be,bg=bf.touches;if(J()||W()){be=aF(bf,bd,l)}if((Q()||aY())&&be!==false){be=aF(bf,bd,t)}if(aG()&&be!==false){be=aF(bf,bd,j)}else{if(ao()&&be!==false){be=aF(bf,bd,b)}else{if(ah()&&be!==false){be=aF(bf,bd,B)}}}if(bd===q){bb(bf)}if(bd===h){if(bg){if(!bg.length){bb(bf)}}else{bb(bf)}}return be}function aF(bg,bd,bf){var be;if(bf==l){aR.trigger("swipeStatus",[bd,aP||null,ag||0,ac||0,X,aQ,a3]);if(au.swipeStatus){be=au.swipeStatus.call(aR,bg,bd,aP||null,ag||0,ac||0,X,aQ,a3);if(be===false){return false}}if(bd==h&&aW()){clearTimeout(aX);clearTimeout(af);aR.trigger("swipe",[aP,ag,ac,X,aQ,a3]);if(au.swipe){be=au.swipe.call(aR,bg,aP,ag,ac,X,aQ,a3);if(be===false){return false}}switch(aP){case p:aR.trigger("swipeLeft",[aP,ag,ac,X,aQ,a3]);if(au.swipeLeft){be=au.swipeLeft.call(aR,bg,aP,ag,ac,X,aQ,a3)}break;case o:aR.trigger("swipeRight",[aP,ag,ac,X,aQ,a3]);if(au.swipeRight){be=au.swipeRight.call(aR,bg,aP,ag,ac,X,aQ,a3)}break;case e:aR.trigger("swipeUp",[aP,ag,ac,X,aQ,a3]);if(au.swipeUp){be=au.swipeUp.call(aR,bg,aP,ag,ac,X,aQ,a3)}break;case x:aR.trigger("swipeDown",[aP,ag,ac,X,aQ,a3]);if(au.swipeDown){be=au.swipeDown.call(aR,bg,aP,ag,ac,X,aQ,a3)}break}}}if(bf==t){aR.trigger("pinchStatus",[bd,aJ||null,ap||0,ac||0,X,H,aQ]);if(au.pinchStatus){be=au.pinchStatus.call(aR,bg,bd,aJ||null,ap||0,ac||0,X,H,aQ);if(be===false){return false}}if(bd==h&&ba()){switch(aJ){case c:aR.trigger("pinchIn",[aJ||null,ap||0,ac||0,X,H,aQ]);if(au.pinchIn){be=au.pinchIn.call(aR,bg,aJ||null,ap||0,ac||0,X,H,aQ)}break;case A:aR.trigger("pinchOut",[aJ||null,ap||0,ac||0,X,H,aQ]);if(au.pinchOut){be=au.pinchOut.call(aR,bg,aJ||null,ap||0,ac||0,X,H,aQ)}break}}}if(bf==B){if(bd===q||bd===h){clearTimeout(aX);clearTimeout(af);if(Z()&&!I()){O=ar();aX=setTimeout(f.proxy(function(){O=null;aR.trigger("tap",[bg.target]);if(au.tap){be=au.tap.call(aR,bg,bg.target)}},this),au.doubleTapThreshold)}else{O=null;aR.trigger("tap",[bg.target]);if(au.tap){be=au.tap.call(aR,bg,bg.target)}}}}else{if(bf==j){if(bd===q||bd===h){clearTimeout(aX);clearTimeout(af);O=null;aR.trigger("doubletap",[bg.target]);if(au.doubleTap){be=au.doubleTap.call(aR,bg,bg.target)}}}else{if(bf==b){if(bd===q||bd===h){clearTimeout(aX);O=null;aR.trigger("longtap",[bg.target]);if(au.longTap){be=au.longTap.call(aR,bg,bg.target)}}}}}return be}function am(){var bd=true;if(au.threshold!==null){bd=ag>=au.threshold}return bd}function bc(){var bd=false;if(au.cancelThreshold!==null&&aP!==null){bd=(aT(aP)-ag)>=au.cancelThreshold}return bd}function ae(){if(au.pinchThreshold!==null){return ap>=au.pinchThreshold}return true}function aA(){var bd;if(au.maxTimeThreshold){if(ac>=au.maxTimeThreshold){bd=false}else{bd=true}}else{bd=true}return bd}function ak(bd,be){if(au.preventDefaultEvents===false){return}if(au.allowPageScroll===m){bd.preventDefault()}else{var bf=au.allowPageScroll===s;switch(be){case p:if((au.swipeLeft&&bf)||(!bf&&au.allowPageScroll!=E)){bd.preventDefault()}break;case o:if((au.swipeRight&&bf)||(!bf&&au.allowPageScroll!=E)){bd.preventDefault()}break;case e:if((au.swipeUp&&bf)||(!bf&&au.allowPageScroll!=u)){bd.preventDefault()}break;case x:if((au.swipeDown&&bf)||(!bf&&au.allowPageScroll!=u)){bd.preventDefault()}break;case m:break}}}function ba(){var be=aO();var bd=Y();var bf=ae();return be&&bd&&bf}function aY(){return !!(au.pinchStatus||au.pinchIn||au.pinchOut)}function Q(){return !!(ba()&&aY())}function aW(){var bg=aA();var bi=am();var bf=aO();var bd=Y();var be=bc();var bh=!be&&bd&&bf&&bi&&bg;return bh}function W(){return !!(au.swipe||au.swipeStatus||au.swipeLeft||au.swipeRight||au.swipeUp||au.swipeDown)}function J(){return !!(aW()&&W())}function aO(){return((X===au.fingers||au.fingers===i)||!a)}function Y(){return aQ[0].end.x!==0}function a8(){return !!(au.tap)}function Z(){return !!(au.doubleTap)}function aV(){return !!(au.longTap)}function R(){if(O==null){return false}var bd=ar();return(Z()&&((bd-O)<=au.doubleTapThreshold))}function I(){return R()}function aw(){return((X===1||!a)&&(isNaN(ag)||ag<au.threshold))}function a1(){return((ac>au.longTapThreshold)&&(ag<r))}function ah(){return !!(aw()&&a8())}function aG(){return !!(R()&&Z())}function ao(){return !!(a1()&&aV())}function G(bd){a7=ar();ay=bd.touches.length+1}function S(){a7=0;ay=0}function al(){var bd=false;if(a7){var be=ar()-a7;if(be<=au.fingerReleaseThreshold){bd=true}}return bd}function aB(){return !!(aR.data(C+"_intouch")===true)}function an(bd){if(!aR){return}if(bd===true){aR.bind(ax,a5);aR.bind(V,M);if(T){aR.bind(T,L)}}else{aR.unbind(ax,a5,false);aR.unbind(V,M,false);if(T){aR.unbind(T,L,false)}}aR.data(C+"_intouch",bd===true)}function ai(bf,bd){var be={start:{x:0,y:0},last:{x:0,y:0},end:{x:0,y:0}};be.start.x=be.last.x=be.end.x=bd.pageX||bd.clientX;be.start.y=be.last.y=be.end.y=bd.pageY||bd.clientY;aQ[bf]=be;return be}function aH(bd){var bf=bd.identifier!==undefined?bd.identifier:0;var be=ad(bf);if(be===null){be=ai(bf,bd)}be.last.x=be.end.x;be.last.y=be.end.y;be.end.x=bd.pageX||bd.clientX;be.end.y=bd.pageY||bd.clientY;return be}function ad(bd){return aQ[bd]||null}function aI(bd,be){if(bd==m){return}be=Math.max(be,aT(bd));N[bd].distance=be}function aT(bd){if(N[bd]){return N[bd].distance}return undefined}function ab(){var bd={};bd[p]=av(p);bd[o]=av(o);bd[e]=av(e);bd[x]=av(x);return bd}function av(bd){return{direction:bd,distance:0}}function aM(){return a4-U}function at(bg,bf){var be=Math.abs(bg.x-bf.x);var bd=Math.abs(bg.y-bf.y);return Math.round(Math.sqrt(be*be+bd*bd))}function a9(bd,be){var bf=(be/bd)*1;return bf.toFixed(2)}function aq(){if(H<1){return A}else{return c}}function aS(be,bd){return Math.round(Math.sqrt(Math.pow(bd.x-be.x,2)+Math.pow(bd.y-be.y,2)))}function aE(bg,be){var bd=bg.x-be.x;var bi=be.y-bg.y;var bf=Math.atan2(bi,bd);var bh=Math.round(bf*180/Math.PI);if(bh<0){bh=360-Math.abs(bh)}return bh}function aL(be,bd){if(aU(be,bd)){return m}var bf=aE(be,bd);if((bf<=45)&&(bf>=0)){return p}else{if((bf<=360)&&(bf>=315)){return p}else{if((bf>=135)&&(bf<=225)){return o}else{if((bf>45)&&(bf<135)){return x}else{return e}}}}}function ar(){var bd=new Date();return bd.getTime()}function aZ(bd){bd=f(bd);var bf=bd.offset();var be={left:bf.left,right:bf.left+bd.outerWidth(),top:bf.top,bottom:bf.top+bd.outerHeight()};return be}function F(bd,be){return(bd.x>be.left&&bd.x<be.right&&bd.y>be.top&&bd.y<be.bottom)}function aU(bd,be){return(bd.x==be.x&&bd.y==be.y)}}}));

!function(b){var a=function(d,c){this.$element=b(d);this.$data=b(d).data();this.$options=c;var e=this;b(window).scroll(function(){if(b(window).scrollTop()>=e.$options.calculateBottom()){e.loadMore()}})};a.prototype={constructor:a,loadMore:function(){var c=this;c.$options.loadMore()}};b.fn.infiniteScroll=function(c){return this.each(function(){var f=b(this),e=f.data("infinite-search"),d=b.extend({},b.fn.infiniteScroll.defaults,typeof c=="object"&&c);if(!e){f.data("infinite-search",(e=new a(this,d)))}if(typeof d=="string"){e[d]()}})};b.fn.infiniteScroll.defaults={calculateBottom:function(){},getData:function(){},processResults:function(){},url:""};b.fn.infiniteScroll.Constructor=a}(window.jQuery);(function(a,b){if(typeof define==="function"&&define.amd){define(["jquery"],b)}else{b(a.jQuery)}}(this,function(d){var a=false;var e={data:{index:0,name:"scrollbar"},macosx:/mac/i.test(navigator.platform),mobile:/android|webos|iphone|ipad|ipod|blackberry/i.test(navigator.userAgent),overlay:null,scroll:null,scrolls:[],webkit:/webkit/i.test(navigator.userAgent)&&!/edge\/\d+/i.test(navigator.userAgent),rtl:(function(){if(d("html").attr("dir")=="rtl"){return true}return d(".mfilter-free-container.mfilter-direction.rtl").length?true:false})()};e.scrolls.add=function(k){this.remove(k).push(k)};e.scrolls.remove=function(k){while(d.inArray(k,this)>=0){this.splice(d.inArray(k,this),1)}return this};var c={autoScrollSize:true,autoUpdate:true,debug:false,disableBodyScroll:false,duration:200,ignoreMobile:false,ignoreOverlay:false,scrollStep:30,showArrows:false,stepScrolling:true,scrollx:null,scrolly:null,onDestroy:null,onInit:null,onScroll:null,onUpdate:null};var f=function(k){if(!e.scroll){e.overlay=b();e.scroll=j();g();d(window).resize(function(){var m=false;if(e.scroll&&(e.scroll.height||e.scroll.width)){var l=j();if(l.height!==e.scroll.height||l.width!==e.scroll.width){e.scroll=l;m=true}}g(m)})}this.container=k;this.namespace=".scrollbar_"+e.data.index++;this.options=d.extend({},c,window.jQueryScrollbarOptions||{});this.scrollTo=null;this.scrollx={};this.scrolly={};this.maxHeight=this.container.css("max-height");if(typeof this.maxHeight=="undefined"){this.maxHeight=""}k.data(e.data.name,this);e.scrolls.add(this)};f.prototype={destroy:function(){if(!this.wrapper){return}this.container.removeData(e.data.name);e.scrolls.remove(this);var l=this.container.scrollLeft();var k=this.container.scrollTop();this.container.insertBefore(this.wrapper).css({height:"",margin:"","max-height":this.container.attr("data-max-height")?this.container.attr("data-max-height")+"px":this.maxHeight}).removeClass("scroll-content scroll-scrollx_visible scroll-scrolly_visible").off(this.namespace).scrollLeft(l).scrollTop(k);this.scrollx.scroll.removeClass("scroll-scrollx_visible").find("div").andSelf().off(this.namespace);this.scrolly.scroll.removeClass("scroll-scrolly_visible").find("div").andSelf().off(this.namespace);this.wrapper.remove();d(document).add("body").off(this.namespace);if(d.isFunction(this.options.onDestroy)){this.options.onDestroy.apply(this,[this.container])}},init:function(v){var m=this,p=this.container,n=this.containerWrapper||p,l=this.namespace,k=d.extend(this.options,v||{}),u={x:this.scrollx,y:this.scrolly},q=this.wrapper;var r={scrollLeft:p.scrollLeft(),scrollTop:p.scrollTop()};if((e.mobile&&k.ignoreMobile)||(e.overlay&&k.ignoreOverlay)||(e.macosx&&!e.webkit)){return false}if(!q){this.wrapper=q=d("<div>").addClass("scroll-wrapper").addClass(p.attr("class")).insertBefore(p).append(p);if(p.is("textarea")){this.containerWrapper=n=d("<div>").insertBefore(p).append(p);q.addClass("scroll-textarea")}n.addClass("scroll-content").css({height:"auto","max-height":this.container.attr("data-max-height")?this.container.attr("data-max-height")+"px":this.maxHeight}).css("margin-"+(e.rtl?"left":"right"),e.scroll.width*-1+"px");p.on("scroll"+l,function(o){if(d.isFunction(k.onScroll)){k.onScroll.call(m,{maxScroll:u.y.maxScrollOffset,scroll:p.scrollTop(),size:u.y.size,visible:u.y.visible},{maxScroll:u.x.maxScrollOffset,scroll:p.scrollLeft(),size:u.x.size,visible:u.x.visible})}u.x.isVisible&&u.x.scroll.bar.css("left",p.scrollLeft()*u.x.kx+"px");u.y.isVisible&&u.y.scroll.bar.css("top",p.scrollTop()*u.y.kx+"px")});q.on("scroll"+l,function(){q.scrollTop(0).scrollLeft(0)});if(k.disableBodyScroll){var t=function(o){h(o)?u.y.isVisible&&u.y.mousewheel(o):u.x.isVisible&&u.x.mousewheel(o)};q.on("MozMousePixelScroll"+l,t);q.on("mousewheel"+l,t);if(e.mobile){q.on("touchstart"+l,function(s){var x=s.originalEvent.touches&&s.originalEvent.touches[0]||s;var o={pageX:x.pageX,pageY:x.pageY};var w={left:p.scrollLeft(),top:p.scrollTop()};d(document).on("touchmove"+l,function(y){var z=y.originalEvent.targetTouches&&y.originalEvent.targetTouches[0]||y;p.scrollLeft(w.left+o.pageX-z.pageX);p.scrollTop(w.top+o.pageY-z.pageY);y.preventDefault()});d(document).on("touchend"+l,function(){d(document).off(l)})})}}if(d.isFunction(k.onInit)){k.onInit.apply(this,[p])}}else{n.css({height:"auto","max-height":this.container.attr("data-max-height")?this.container.attr("data-max-height")+"px":this.maxHeight}).css("margin-"+(e.rtl?"left":"right"),e.scroll.width*-1+"px")}d.each(u,function(A,B){var w=null;var z=1;var s=(A==="x")?"scrollLeft":"scrollTop";var y=k.scrollStep;var o=function(){var C=p[s]();p[s](C+y);if(z==1&&(C+y)>=x){C=p[s]()}if(z==-1&&(C+y)<=x){C=p[s]()}if(p[s]()==C&&w){w()}};var x=0;if(!B.scroll){B.scroll=m._getScroll(k["scroll"+A]).addClass("scroll-"+A);if(k.showArrows){B.scroll.addClass("scroll-element_arrows_visible")}B.mousewheel=function(D){if(!B.isVisible||(A==="x"&&h(D))){return true}if(A==="y"&&!h(D)){u.x.mousewheel(D);return true}var E=D.originalEvent.wheelDelta*-1||D.originalEvent.detail;var C=B.size-B.visible-B.offset;if((E>0&&x<C)||(E<0&&x>0)){x=x+E;if(x<0){x=0}if(x>C){x=C}m.scrollTo=m.scrollTo||{};m.scrollTo[s]=x;setTimeout(function(){if(m.scrollTo){p.stop().animate(m.scrollTo,240,"linear",function(){x=p[s]()});m.scrollTo=null}},1)}D.preventDefault();return false};B.scroll.on("MozMousePixelScroll"+l,B.mousewheel).on("mousewheel"+l,B.mousewheel).on("mouseenter"+l,function(){x=p[s]()});B.scroll.find(".scroll-arrow, .scroll-element_track").on("mousedown"+l,function(C){if(C.which!=1){return true}z=1;var E={eventOffset:C[(A==="x")?"pageX":"pageY"],maxScrollValue:B.size-B.visible-B.offset,scrollbarOffset:B.scroll.bar.offset()[(A==="x")?"left":"top"],scrollbarSize:B.scroll.bar[(A==="x")?"outerWidth":"outerHeight"]()};var D=0,F=0;if(d(this).hasClass("scroll-arrow")){z=d(this).hasClass("scroll-arrow_more")?1:-1;y=k.scrollStep*z;x=z>0?E.maxScrollValue:0}else{z=(E.eventOffset>(E.scrollbarOffset+E.scrollbarSize)?1:(E.eventOffset<E.scrollbarOffset?-1:0));y=Math.round(B.visible*0.75)*z;x=(E.eventOffset-E.scrollbarOffset-(k.stepScrolling?(z==1?E.scrollbarSize:0):Math.round(E.scrollbarSize/2)));x=p[s]()+(x/B.kx)}m.scrollTo=m.scrollTo||{};m.scrollTo[s]=k.stepScrolling?p[s]()+y:x;if(k.stepScrolling){w=function(){x=p[s]();clearInterval(F);clearTimeout(D);D=0;F=0};D=setTimeout(function(){F=setInterval(o,40)},k.duration+100)}setTimeout(function(){if(m.scrollTo){p.animate(m.scrollTo,k.duration);m.scrollTo=null}},1);return m._handleMouseDown(w,C)});B.scroll.bar.on("mousedown"+l,function(D){if(D.which!=1){return true}var C=D[(A==="x")?"pageX":"pageY"];var E=p[s]();B.scroll.addClass("scroll-draggable");d(document).on("mousemove"+l,function(F){var G=parseInt((F[(A==="x")?"pageX":"pageY"]-C)/B.kx,10);p[s](E+G)});return m._handleMouseDown(function(){B.scroll.removeClass("scroll-draggable");x=p[s]()},D)})}});d.each(u,function(w,x){var o="scroll-scroll"+w+"_visible";var s=(w=="x")?u.y:u.x;x.scroll.removeClass(o);s.scroll.removeClass(o);n.removeClass(o)});d.each(u,function(o,s){d.extend(s,(o=="x")?{offset:parseInt(p.css("left"),10)||0,size:p.prop("scrollWidth"),visible:q.width()}:{offset:parseInt(p.css("top"),10)||0,size:p.prop("scrollHeight"),visible:q.height()})});this._updateScroll("x",this.scrollx);this._updateScroll("y",this.scrolly);if(d.isFunction(k.onUpdate)){k.onUpdate.apply(this,[p])}d.each(u,function(B,A){var w=(B==="x")?"left":"top";var s=(B==="x")?"outerWidth":"outerHeight";var y=(B==="x")?"width":"height";var z=parseInt(p.css(w),10)||0;var x=A.size;var C=A.visible+z;var o=A.scroll.size[s]()+(parseInt(A.scroll.size.css(w),10)||0);if(k.autoScrollSize){A.scrollbarSize=parseInt(o*C/x,10);A.scroll.bar.css(y,A.scrollbarSize+"px")}A.scrollbarSize=A.scroll.bar[s]();A.kx=((o-A.scrollbarSize)/(x-C))||1;A.maxScrollOffset=x-C});p.scrollLeft(r.scrollLeft).scrollTop(r.scrollTop).trigger("scroll")},_getScroll:function(k){var l={advanced:['<div class="scroll-element">','<div class="scroll-element_corner"></div>','<div class="scroll-arrow scroll-arrow_less"></div>','<div class="scroll-arrow scroll-arrow_more"></div>','<div class="scroll-element_outer">','<div class="scroll-element_size"></div>','<div class="scroll-element_inner-wrapper">','<div class="scroll-element_inner scroll-element_track">','<div class="scroll-element_inner-bottom"></div>',"</div>","</div>",'<div class="iScrollIndicator">','<div class="scroll-bar_body">','<div class="scroll-bar_body-inner"></div>',"</div>",'<div class="scroll-bar_bottom"></div>','<div class="scroll-bar_center"></div>',"</div>","</div>","</div>"].join(""),simple:['<div class="scroll-element">','<div class="scroll-element_outer">','<div class="scroll-element_size"></div>','<div class="scroll-element_track"></div>','<div class="iScrollIndicator"></div>',"</div>","</div>"].join("")};if(l[k]){k=l[k]}if(!k){k=l.simple}if(typeof(k)=="string"){k=d(k).appendTo(this.wrapper)}else{k=d(k)}d.extend(k,{bar:k.find(".iScrollIndicator"),size:k.find(".scroll-element_size"),track:k.find(".scroll-element_track")});return k},_handleMouseDown:function(m,l){var k=this.namespace;d(document).on("blur"+k,function(){d(document).add("body").off(k);m&&m()});d(document).on("dragstart"+k,function(n){n.preventDefault();return false});d(document).on("mouseup"+k,function(){d(document).add("body").off(k);m&&m()});d("body").on("selectstart"+k,function(n){n.preventDefault();return false});l&&l.preventDefault();return false},_updateScroll:function(q,p){var l=this.container,r=this.containerWrapper||l,s="scroll-scroll"+q+"_visible",o=(q==="x")?this.scrolly:this.scrollx,n=parseInt(this.container.css((q==="x")?"left":"top"),10)||0,k=this.wrapper;var m=p.size;var t=p.visible+n;p.isVisible=(m-t)>1;if(p.isVisible){p.scroll.addClass(s);o.scroll.addClass(s);r.addClass(s)}else{p.scroll.removeClass(s);o.scroll.removeClass(s);r.removeClass(s)}if(q==="y"){if(l.is("textarea")||m<t){r.css({height:(t+e.scroll.height)+"px","max-height":"none"})}else{r.css({height:"auto","max-height":this.container.attr("data-max-height")?this.container.attr("data-max-height")+"px":this.maxHeight})}}if(p.size!=l.prop("scrollWidth")||o.size!=l.prop("scrollHeight")||p.visible!=k.width()||o.visible!=k.height()||p.offset!=(parseInt(l.css("left"),10)||0)||o.offset!=(parseInt(l.css("top"),10)||0)){d.extend(this.scrollx,{offset:parseInt(l.css("left"),10)||0,size:l.prop("scrollWidth"),visible:k.width()});d.extend(this.scrolly,{offset:parseInt(l.css("top"),10)||0,size:this.container.prop("scrollHeight"),visible:k.height()});this._updateScroll(q==="x"?"y":"x",o)}}};var i=f;d.fn.scrollbar=function(l,k){if(typeof l!=="string"){k=l;l="init"}if(typeof k==="undefined"){k=[]}if(!d.isArray(k)){k=[k]}this.not("body, .scroll-wrapper").each(function(){var n=d(this),m=n.data(e.data.name);if(m||l==="init"){if(!m){m=new i(n)}if(m[l]){m[l].apply(m,k)}}});return this};d.fn.scrollbar.options=c;var g=(function(){var l=0,k=0;return function(q){var p,n,o,m,t,s,r;for(p=0;p<e.scrolls.length;p++){m=e.scrolls[p];n=m.container;o=m.options;t=m.wrapper;s=m.scrollx;r=m.scrolly;if(q||(o.autoUpdate&&t&&t.is(":visible")&&(n.prop("scrollWidth")!=s.size||n.prop("scrollHeight")!=r.size||t.width()!=s.visible||t.height()!=r.visible))){m.init();if(o.debug){window.console&&console.log({scrollHeight:n.prop("scrollHeight")+":"+m.scrolly.size,scrollWidth:n.prop("scrollWidth")+":"+m.scrollx.size,visibleHeight:t.height()+":"+m.scrolly.visible,visibleWidth:t.width()+":"+m.scrollx.visible},true);k++}}}if(a&&k>10){window.console&&console.log("Scroll updates exceed 10");g=function(){}}else{clearTimeout(l);l=setTimeout(g,300)}}})();function j(q){if(e.webkit&&!q){return{height:0,width:0}}if(e.scrollSize){return e.scrollSize}var n={border:"none","box-sizing":"content-box",height:"200px",margin:"0",padding:"0",width:"200px"};var p=d.extend({overflow:"scroll",position:"absolute",top:"-1000px"},n);p[e.rtl?"right":"left"]="-1000px";var l=d("<div>").css(n),m=d("<div>").css(p).append(l).appendTo("body");m.scrollLeft(1000).scrollTop(1000);var k=Math.ceil((m.offset().top-l.offset().top)||0),o=Math.ceil((m.offset().left-l.offset().left)||0);e.scrollSize={height:k,width:e.rtl&&!o?k:o};m.remove();return e.scrollSize}function b(){var k=j(true);return !(k.height||k.width)}function h(k){var l=k.originalEvent;if(l.axis&&l.axis===l.HORIZONTAL_AXIS){return false}if(l.wheelDeltaX){return false}return true}}));

/*
 * jQuery.liveFilter
 *
 * Copyright (c) 2009 Mike Merritt
 *
 * Forked by Lim Chee Aun (cheeaun.com)
 * 
 */ 
(function($){
	$.fn.liveFilter = function(inputEl, filterEl, options){
		var defaults = {
			filterChildSelector: null,
			filter: function(el, val){
				return $(el).text().toUpperCase().indexOf(val.toUpperCase()) >= 0;
			},
			before: function(){},
			after: function(){}
		};
		var options = $.extend(defaults, options);
		var self = $(this);

		var filter = options.filter;
		$(inputEl).keyup(function(){
			var el = self.find(filterEl);
			if (options.filterChildSelector) el = el.find(options.filterChildSelector);
			
			var val = $(this).val();
			var contains = el.filter(function(){
				return filter(this, val);
			});
			
			var containsNot = el.not(contains);
			if (options.filterChildSelector){
				contains = contains.parents(filterEl);
				//containsNot = containsNot.parents(filterEl).hide();
				containersNot = containsNot.parents(filterEl).addClass('mfilter-hide-by-live-filter');
			}

			options.before.call(this, contains, containsNot);

			contains.removeClass('mfilter-hide-by-live-filter');
			containsNot.addClass('mfilter-hide-by-live-filter');

			//contains.show();
			//containsNot.hide();

			if (val === '') {
				contains.removeClass('mfilter-hide-by-live-filter');
				containsNot.removeClass('mfilter-hide-by-live-filter');
				//contains.show();
				//containsNot.show();
			}

			options.after.call(this, contains, containsNot);
		});
	};
})(jQuery);


(function(d){if(!String.prototype.includes){(function(){var j={}.toString;var g=(function(){try{var n={};var m=Object.defineProperty;var k=m(n,n,n)&&m}catch(l){}return k}());var i="".indexOf;var h=function(p){if(this==null){throw new TypeError()}var n=String(this);if(p&&j.call(p)=="[object RegExp]"){throw new TypeError()}var l=n.length;var m=String(p);var o=m.length;var k=arguments.length>1?arguments[1]:undefined;var r=k?Number(k):0;if(r!=r){r=0}var q=Math.min(Math.max(r,0),l);if(o+q>l){return false}return i.call(n,m,r)!=-1};if(g){g(String.prototype,"includes",{value:h,configurable:true,writable:true})}else{String.prototype.includes=h}}())}if(!String.prototype.startsWith){(function(){var g=(function(){try{var m={};var l=Object.defineProperty;var j=l(m,m,m)&&l}catch(k){}return j}());var i={}.toString;var h=function(q){if(this==null){throw new TypeError()}var n=String(this);if(q&&i.call(q)=="[object RegExp]"){throw new TypeError()}var j=n.length;var r=String(q);var l=r.length;var m=arguments.length>1?arguments[1]:undefined;var p=m?Number(m):0;if(p!=p){p=0}var k=Math.min(Math.max(p,0),j);if(l+k>j){return false}var o=-1;while(++o<l){if(n.charCodeAt(k+o)!=r.charCodeAt(o)){return false}}return true};if(g){g(String.prototype,"startsWith",{value:h,configurable:true,writable:true})}else{String.prototype.startsWith=h}}())}if(!Object.keys){Object.keys=function(i,g,h){h=[];for(g in i){h.hasOwnProperty.call(i,g)&&h.push(g)}return h}}d.fn.triggerNative=function(g){var h=this[0],i;if(h.dispatchEvent){if(typeof Event==="function"){i=new Event(g,{bubbles:true})}else{i=document.createEvent("Event");i.initEvent(g,true,false)}h.dispatchEvent(i)}else{if(h.fireEvent){i=document.createEventObject();i.eventType=g;h.fireEvent("on"+g,i)}this.trigger(g)}};d.expr[":"].icontains=function(j,g,i){var k=d(j);var h=(k.data("tokens")||k.text()).toUpperCase();return h.includes(i[3].toUpperCase())};d.expr[":"].ibegins=function(j,g,i){var k=d(j);var h=(k.data("tokens")||k.text()).toUpperCase();return h.startsWith(i[3].toUpperCase())};d.expr[":"].aicontains=function(j,g,i){var k=d(j);var h=(k.data("tokens")||k.data("normalizedText")||k.text()).toUpperCase();return h.includes(i[3].toUpperCase())};d.expr[":"].aibegins=function(j,g,i){var k=d(j);var h=(k.data("tokens")||k.data("normalizedText")||k.text()).toUpperCase();return h.startsWith(i[3].toUpperCase())};function f(h){var g=[{re:/[\xC0-\xC6]/g,ch:"A"},{re:/[\xE0-\xE6]/g,ch:"a"},{re:/[\xC8-\xCB]/g,ch:"E"},{re:/[\xE8-\xEB]/g,ch:"e"},{re:/[\xCC-\xCF]/g,ch:"I"},{re:/[\xEC-\xEF]/g,ch:"i"},{re:/[\xD2-\xD6]/g,ch:"O"},{re:/[\xF2-\xF6]/g,ch:"o"},{re:/[\xD9-\xDC]/g,ch:"U"},{re:/[\xF9-\xFC]/g,ch:"u"},{re:/[\xC7-\xE7]/g,ch:"c"},{re:/[\xD1]/g,ch:"N"},{re:/[\xF1]/g,ch:"n"}];d.each(g,function(){h=h.replace(this.re,this.ch)});return h}function e(h){var j={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#x27;","`":"&#x60;"};var l="(?:"+Object.keys(j).join("|")+")",k=new RegExp(l),i=new RegExp(l,"g"),g=h==null?"":""+h;return k.test(g)?g.replace(i,function(m){return j[m]}):g}var b=function(h,g,i){if(i){i.stopPropagation();i.preventDefault()}this.$element=d(h);this.$newElement=null;this.$button=null;this.$menu=null;this.$lis=null;this.options=g;if(this.options.title===null){this.options.title=this.$element.attr("title")}this.val=b.prototype.val;this.render=b.prototype.render;this.refresh=b.prototype.refresh;this.setStyle=b.prototype.setStyle;this.selectAll=b.prototype.selectAll;this.deselectAll=b.prototype.deselectAll;this.destroy=b.prototype.destroy;this.remove=b.prototype.remove;this.show=b.prototype.show;this.hide=b.prototype.hide;this.init()};b.VERSION="1.10.0";b.DEFAULTS={noneSelectedText:"Nothing selected",noneResultsText:"No results matched {0}",countSelectedText:function(h,g){return(h==1)?"{0} item selected":"{0} items selected"},maxOptionsText:function(g,h){return[(g==1)?"Limit reached ({n} item max)":"Limit reached ({n} items max)",(h==1)?"Group limit reached ({n} item max)":"Group limit reached ({n} items max)"]},selectAllText:"Select All",deselectAllText:"Deselect All",doneButton:false,doneButtonText:"Close",multipleSeparator:", ",styleBase:"btn",style:"btn-default",size:"auto",title:null,selectedTextFormat:"values",width:false,container:false,hideDisabled:false,showSubtext:false,showIcon:true,showContent:true,dropupAuto:true,header:false,liveSearch:false,liveSearchPlaceholder:null,liveSearchNormalize:false,liveSearchStyle:"contains",actionsBox:false,iconBase:"glyphicon",tickIcon:"glyphicon-ok",showTick:false,template:{caret:'<span class="caret"></span>'},maxOptions:false,mobile:false,selectOnTab:false,dropdownAlignRight:false};b.prototype={constructor:b,init:function(){var g=this,h=this.$element.attr("id");this.$element.addClass("bs-select-hidden");this.liObj={};this.multiple=this.$element.prop("multiple");this.autofocus=this.$element.prop("autofocus");this.$newElement=this.createView();this.$element.after(this.$newElement).appendTo(this.$newElement);this.$button=this.$newElement.children("button");this.$menu=this.$newElement.children(".dropdown-menu");this.$menuInner=this.$menu.children(".inner");this.$searchbox=this.$menu.find("input");this.$element.removeClass("bs-select-hidden");if(this.options.dropdownAlignRight){this.$menu.addClass("dropdown-menu-right")}if(typeof h!=="undefined"){this.$button.attr("data-id",h);d('label[for="'+h+'"]').click(function(i){i.preventDefault();g.$button.focus()})}this.checkDisabled();this.clickListener();if(this.options.liveSearch){this.liveSearchListener()}this.render();this.setStyle();this.setWidth();if(this.options.container){this.selectPosition()}this.$menu.data("this",this);this.$newElement.data("this",this);if(this.options.mobile){this.mobile()}this.$newElement.on({"hide.bs.dropdown":function(i){g.$element.trigger("hide.bs.select",i)},"hidden.bs.dropdown":function(i){g.$element.trigger("hidden.bs.select",i)},"show.bs.dropdown":function(i){g.$element.trigger("show.bs.select",i)},"shown.bs.dropdown":function(i){g.$element.trigger("shown.bs.select",i)}});if(g.$element[0].hasAttribute("required")){this.$element.on("invalid",function(){g.$button.addClass("bs-invalid").focus();g.$element.on({"focus.bs.select":function(){g.$button.focus();g.$element.off("focus.bs.select")},"shown.bs.select":function(){g.$element.val(g.$element.val()).off("shown.bs.select")},"rendered.bs.select":function(){if(this.validity.valid){g.$button.removeClass("bs-invalid")}g.$element.off("rendered.bs.select")}})})}setTimeout(function(){g.$element.trigger("loaded.bs.select")})},createDropdown:function(){var l=(this.multiple||this.options.showTick)?" show-tick":"",h=this.$element.parent().hasClass("input-group")?" input-group-btn":"",n=this.autofocus?" autofocus":"";var m=this.options.header?'<div class="popover-title"><button type="button" class="close" aria-hidden="true">&times;</button>'+this.options.header+"</div>":"";var k=this.options.liveSearch?'<div class="bs-searchbox"><input type="text" class="form-control" autocomplete="off"'+(null===this.options.liveSearchPlaceholder?"":' placeholder="'+e(this.options.liveSearchPlaceholder)+'"')+"></div>":"";var j=this.multiple&&this.options.actionsBox?'<div class="bs-actionsbox"><div class="btn-group btn-group-sm btn-block"><button type="button" class="actions-btn bs-select-all btn btn-default">'+this.options.selectAllText+'</button><button type="button" class="actions-btn bs-deselect-all btn btn-default">'+this.options.deselectAllText+"</button></div></div>":"";var g=this.multiple&&this.options.doneButton?'<div class="bs-donebutton"><div class="btn-group btn-block"><button type="button" class="btn btn-sm btn-default">'+this.options.doneButtonText+"</button></div></div>":"";var i='<div class="btn-group bootstrap-select_mf'+l+h+'"><button type="button" class="'+this.options.styleBase+' dropdown-toggle" data-toggle="dropdown"'+n+'><span class="filter-option pull-left"></span>&nbsp;<span class="bs-caret">'+this.options.template.caret+'</span></button><div class="dropdown-menu open">'+m+k+j+'<ul class="dropdown-menu inner" role="menu"></ul>'+g+"</div></div>";return d(i)},createView:function(){var h=this.createDropdown(),g=this.createLi();h.find("ul")[0].innerHTML=g;return h},reloadLi:function(){this.destroyLi();var g=this.createLi();this.$menuInner[0].innerHTML=g},destroyLi:function(){this.$menu.find("li").remove()},createLi:function(){var m=this,l=[],n=0,i=document.createElement("option"),h=-1;var g=function(r,p,q,o){return"<li"+((typeof q!=="undefined"&""!==q)?' class="'+q+'"':"")+((typeof p!=="undefined"&null!==p)?' data-original-index="'+p+'"':"")+((typeof o!=="undefined"&null!==o)?'data-optgroup="'+o+'"':"")+">"+r+"</li>"};var k=function(r,o,q,p){return'<a tabindex="0"'+(typeof o!=="undefined"?' class="'+o+'"':"")+(typeof q!=="undefined"?' style="'+q+'"':"")+(m.options.liveSearchNormalize?' data-normalized-text="'+f(e(r))+'"':"")+(typeof p!=="undefined"||p!==null?' data-tokens="'+p+'"':"")+">"+r+'<span class="'+m.options.iconBase+" "+m.options.tickIcon+' check-mark"></span></a>'};if(this.options.title&&!this.multiple){h--;if(!this.$element.find(".bs-title-option").length){var j=this.$element[0];i.className="bs-title-option";i.appendChild(document.createTextNode(this.options.title));i.value="";j.insertBefore(i,j.firstChild);if(d(j.options[j.selectedIndex]).attr("selected")===undefined){i.selected=true}}}this.$element.find("option").each(function(s){var u=d(this);h++;if(u.hasClass("bs-title-option")){return}var p=this.className||"",t=this.style.cssText,C=(u.data("content")?u.data("content"):u.html()).replace(/&amp;quot;/g,'"'),v=u.data("tokens")?u.data("tokens"):null,z=typeof u.data("subtext")!=="undefined"?'<small class="text-muted">'+u.data("subtext")+"</small>":"",x=typeof u.data("icon")!=="undefined"?'<span class="'+m.options.iconBase+" "+u.data("icon")+'"></span> ':"",B=this.parentNode.tagName==="OPTGROUP",A=this.disabled||(B&&this.parentNode.disabled),q=u.data("image")?u.data("image"):null,w=u.data("total")?'<small class="text-muted">('+u.data("total")+")</small>":"";if(x!==""&&A){x="<span>"+x+"</span>"}if(m.options.hideDisabled&&A&&!B){h--;return}if(!u.data("content")){C=x+'<span class="text">'+(q?'<img src="'+q+'" alt="" /> ':"")+C+z+w+"</span>"}if(B&&u.data("divider")!==true){var r=" "+this.parentNode.className||"";if(u.index()===0){n+=1;var y=this.parentNode.label,D=typeof u.parent().data("subtext")!=="undefined"?'<small class="text-muted">'+u.parent().data("subtext")+"</small>":"",o=u.parent().data("icon")?'<span class="'+m.options.iconBase+" "+u.parent().data("icon")+'"></span> ':"";y=o+'<span class="text">'+y+D+"</span>";if(s!==0&&l.length>0){h++;l.push(g("",null,"divider",n+"div"))}h++;l.push(g(y,null,"dropdown-header"+r,n))}if(m.options.hideDisabled&&A){h--;return}l.push(g(k(C,"opt "+p+r,t,v),s,"",n))}else{if(u.data("divider")===true){l.push(g("",s,"divider"))}else{if(u.data("hidden")===true){l.push(g(k(C,p,t,v),s,"hidden is-hidden"))}else{if(this.previousElementSibling&&this.previousElementSibling.tagName==="OPTGROUP"){h++;l.push(g("",null,"divider",n+"div"))}l.push(g(k(C,p,t,v),s))}}}m.liObj[s]=h});if(!this.multiple&&this.$element.find("option:selected").length===0&&!this.options.title){this.$element.find("option").eq(0).prop("selected",true).attr("selected","selected")}return l.join("")},findLis:function(){if(this.$lis==null){this.$lis=this.$menu.find("li")}return this.$lis},render:function(j){var i=this,l;if(j!==false){this.$element.find("option").each(function(o){var p=i.findLis().eq(i.liObj[o]);i.setDisabled(o,this.disabled||this.parentNode.tagName==="OPTGROUP"&&this.parentNode.disabled,p);i.setSelected(o,this.selected,p)})}this.tabIndex();var n=this.$element.find("option").map(function(){if(this.selected){if(i.options.hideDisabled&&(this.disabled||this.parentNode.tagName==="OPTGROUP"&&this.parentNode.disabled)){return}var s=d(this),p=s.data("icon")&&i.options.showIcon?'<i class="'+i.options.iconBase+" "+s.data("icon")+'"></i> ':"",r=s.data("image")?'<img src="'+s.data("image")+'" alt="" /> ':"",o,q=s.data("total")?'<small class="text-muted">('+s.data("total")+")</small>":"";if(i.options.showSubtext&&s.data("subtext")&&!i.multiple){o=' <small class="text-muted">'+s.data("subtext")+"</small>"}else{o=""}if(typeof s.attr("title")!=="undefined"){return s.attr("title")}else{if(s.data("content")&&i.options.showContent){return s.data("content")}else{return p+r+s.html()+o+q}}}}).toArray();var k=!this.multiple?n[0]:n.join(this.options.multipleSeparator);if(this.multiple&&this.options.selectedTextFormat.indexOf("count")>-1){var g=this.options.selectedTextFormat.split(">");if((g.length>1&&n.length>g[1])||(g.length==1&&n.length>=2)){l=this.options.hideDisabled?", [disabled]":"";var h=this.$element.find("option").not('[data-divider="true"], [data-hidden="true"]'+l).length,m=(typeof this.options.countSelectedText==="function")?this.options.countSelectedText(n.length,h):this.options.countSelectedText;k=m.replace("{0}",n.length.toString()).replace("{1}",h.toString())}}if(this.options.title==undefined){this.options.title=this.$element.attr("title")}if(this.options.selectedTextFormat=="static"){k=this.options.title}if(!k){k=typeof this.options.title!=="undefined"?this.options.title:this.options.noneSelectedText}k=k.replace(/&amp;quot;/g,'"');this.$button.attr("title",d.trim(k.replace(/<[^>]*>?/g,"")));this.$button.children(".filter-option").html(k);this.$element.trigger("rendered.bs.select")},setStyle:function(i,h){if(this.$element.attr("class")){this.$newElement.addClass(this.$element.attr("class").replace(/mf_selectpicker|mobile-device|bs-select-hidden|validate\[.*\]/gi,""))}var g=i?i:this.options.style;if(h=="add"){this.$button.addClass(g)}else{if(h=="remove"){this.$button.removeClass(g)}else{this.$button.removeClass(this.options.style);this.$button.addClass(g)}}},liHeight:function(m){if(!m&&(this.options.size===false||this.sizeInfo)){return}var k=document.createElement("div"),g=document.createElement("div"),q=document.createElement("ul"),y=document.createElement("li"),x=document.createElement("li"),C=document.createElement("a"),w=document.createElement("span"),B=this.options.header&&this.$menu.find(".popover-title").length>0?this.$menu.find(".popover-title")[0].cloneNode(true):null,r=this.options.liveSearch?document.createElement("div"):null,s=this.options.actionsBox&&this.multiple&&this.$menu.find(".bs-actionsbox").length>0?this.$menu.find(".bs-actionsbox")[0].cloneNode(true):null,j=this.options.doneButton&&this.multiple&&this.$menu.find(".bs-donebutton").length>0?this.$menu.find(".bs-donebutton")[0].cloneNode(true):null;w.className="text";k.className=this.$menu[0].parentNode.className+" open";g.className="dropdown-menu open";q.className="dropdown-menu inner";y.className="divider";w.appendChild(document.createTextNode("Inner text"));C.appendChild(w);x.appendChild(C);q.appendChild(x);q.appendChild(y);if(B){g.appendChild(B)}if(r){var u=document.createElement("span");r.className="bs-searchbox";u.className="form-control";r.appendChild(u);g.appendChild(r)}if(s){g.appendChild(s)}g.appendChild(q);if(j){g.appendChild(j)}k.appendChild(g);document.body.appendChild(k);var i=C.offsetHeight,A=B?B.offsetHeight:0,t=r?r.offsetHeight:0,p=s?s.offsetHeight:0,l=j?j.offsetHeight:0,v=d(y).outerHeight(true),h=typeof getComputedStyle==="function"?getComputedStyle(g):false,n=h?null:d(g),z=parseInt(h?h.paddingTop:n.css("paddingTop"))+parseInt(h?h.paddingBottom:n.css("paddingBottom"))+parseInt(h?h.borderTopWidth:n.css("borderTopWidth"))+parseInt(h?h.borderBottomWidth:n.css("borderBottomWidth")),o=z+parseInt(h?h.marginTop:n.css("marginTop"))+parseInt(h?h.marginBottom:n.css("marginBottom"))+2;document.body.removeChild(k);this.sizeInfo={liHeight:i,headerHeight:A,searchHeight:t,actionsHeight:p,doneButtonHeight:l,dividerHeight:v,menuPadding:z,menuExtras:o}},setSize:function(){this.findLis();this.liHeight();if(this.options.header){this.$menu.css("padding-top",0)}if(this.options.size===false){return}var o=this,l=this.$menu,i=this.$menuInner,u=d(window),A=this.$newElement[0].offsetHeight,j=this.sizeInfo.liHeight,y=this.sizeInfo.headerHeight,r=this.sizeInfo.searchHeight,n=this.sizeInfo.actionsHeight,k=this.sizeInfo.doneButtonHeight,q=this.sizeInfo.dividerHeight,x=this.sizeInfo.menuPadding,m=this.sizeInfo.menuExtras,v=this.options.hideDisabled?".disabled":"",w,s,B,z,p=function(){B=o.$newElement.offset().top-u.scrollTop();z=u.height()-B-A};p();if(this.options.size==="auto"){var h=function(){var F,E=function(I,H){return function(J){if(H){return(J.classList?J.classList.contains(I):d(J).hasClass(I))}else{return !(J.classList?J.classList.contains(I):d(J).hasClass(I))}}},D=o.$menuInner[0].getElementsByTagName("li"),C=Array.prototype.filter?Array.prototype.filter.call(D,E("hidden",false)):o.$lis.not(".hidden"),G=Array.prototype.filter?Array.prototype.filter.call(C,E("dropdown-header",true)):C.filter(".dropdown-header");p();w=z-m;if(o.options.container){if(!l.data("height")){l.data("height",l.height())}s=l.data("height")}else{s=l.height()}if(o.options.dropupAuto){o.$newElement.toggleClass("dropup",B>z&&(w-m)<s)}if(o.$newElement.hasClass("dropup")){w=B-m}if((C.length+G.length)>3){F=j*3+m-2}else{F=0}l.css({"max-height":w+"px",overflow:"hidden","min-height":F+y+r+n+k+"px"});i.css({"max-height":w-y-r-n-k-x+"px","overflow-y":"auto","min-height":Math.max(F-x,0)+"px"})};h();this.$searchbox.off("input.getSize propertychange.getSize").on("input.getSize propertychange.getSize",h);u.off("resize.getSize scroll.getSize").on("resize.getSize scroll.getSize",h)}else{if(this.options.size&&this.options.size!="auto"&&this.$lis.not(v).length>this.options.size){var t=this.$lis.not(".divider").not(v).children().slice(0,this.options.size).last().parent().index(),g=this.$lis.slice(0,t+1).filter(".divider").length;w=j*this.options.size+g*q+x;if(o.options.container){if(!l.data("height")){l.data("height",l.height())}s=l.data("height")}else{s=l.height()}if(o.options.dropupAuto){this.$newElement.toggleClass("dropup",B>z&&(w-m)<s)}l.css({"max-height":w+y+r+n+k+"px",overflow:"hidden","min-height":""});i.css({"max-height":w-x+"px","overflow-y":"auto","min-height":""})}}},setWidth:function(){if(this.options.width==="auto"){this.$menu.css("min-width","0");var h=this.$menu.parent().clone().appendTo("body"),g=this.options.container?this.$newElement.clone().appendTo("body"):h,i=h.children(".dropdown-menu").outerWidth(),j=g.css("width","auto").children("button").outerWidth();h.remove();g.remove();this.$newElement.css("width",Math.max(i,j)+"px")}else{if(this.options.width==="fit"){this.$menu.css("min-width","");this.$newElement.css("width","").addClass("fit-width")}else{if(this.options.width){this.$menu.css("min-width","");this.$newElement.css("width",this.options.width)}else{this.$menu.css("min-width","");this.$newElement.css("width","")}}}if(this.$newElement.hasClass("fit-width")&&this.options.width!=="fit"){this.$newElement.removeClass("fit-width")}},selectPosition:function(){this.$bsContainer=d('<div class="bs-container" />');var h=this,j,i,g=function(k){h.$bsContainer.addClass(k.attr("class").replace(/form-control|fit-width/gi,"")).toggleClass("dropup",k.hasClass("dropup"));j=k.offset();i=k.hasClass("dropup")?0:k[0].offsetHeight;h.$bsContainer.css({top:j.top+i,left:j.left,width:k[0].offsetWidth})};this.$button.on("click",function(){var k=d(this);if(h.isDisabled()){return}g(h.$newElement);h.$bsContainer.appendTo(h.options.container).toggleClass("open",!k.hasClass("open")).append(h.$menu)});d(window).on("resize scroll",function(){g(h.$newElement)});this.$element.on("hide.bs.select",function(){h.$menu.data("height",h.$menu.height());h.$bsContainer.detach()})},setSelected:function(g,i,h){if(!h){h=this.findLis().eq(this.liObj[g])}h.toggleClass("selected",i)},setDisabled:function(g,i,h){if(!h){h=this.findLis().eq(this.liObj[g])}if(i){h.addClass("disabled").children("a").attr("href","#").attr("tabindex",-1)}else{h.removeClass("disabled").children("a").removeAttr("href").attr("tabindex",0)}},isDisabled:function(){return this.$element[0].disabled},checkDisabled:function(){var g=this;if(this.isDisabled()){this.$newElement.addClass("disabled");this.$button.addClass("disabled").attr("tabindex",-1)}else{if(this.$button.hasClass("disabled")){this.$newElement.removeClass("disabled");this.$button.removeClass("disabled")}if(this.$button.attr("tabindex")==-1&&!this.$element.data("tabindex")){this.$button.removeAttr("tabindex")}}this.$button.click(function(){return !g.isDisabled()})},tabIndex:function(){if(this.$element.data("tabindex")!==this.$element.attr("tabindex")&&(this.$element.attr("tabindex")!==-98&&this.$element.attr("tabindex")!=="-98")){this.$element.data("tabindex",this.$element.attr("tabindex"));this.$button.attr("tabindex",this.$element.data("tabindex"))}this.$element.attr("tabindex",-98)},clickListener:function(){var g=this,h=d(document);this.$newElement.on("touchstart.dropdown",".dropdown-menu",function(i){i.stopPropagation()});h.data("spaceSelect",false);this.$button.on("keyup",function(i){if(/(32)/.test(i.keyCode.toString(10))&&h.data("spaceSelect")){i.preventDefault();h.data("spaceSelect",false)}});this.$button.on("click",function(){g.setSize()});this.$element.on("shown.bs.select",function(){if(!g.options.liveSearch&&!g.multiple){g.$menuInner.find(".selected a").focus()}else{if(!g.multiple){var i=g.liObj[g.$element[0].selectedIndex];if(typeof i!=="number"||g.options.size===false){return}var j=g.$lis.eq(i)[0].offsetTop-g.$menuInner[0].offsetTop;j=j-g.$menuInner[0].offsetHeight/2+g.sizeInfo.liHeight/2;g.$menuInner[0].scrollTop=j}}});this.$menuInner.on("click","li a",function(x){var n=d(this),i=n.parent().data("originalIndex"),v=g.$element.val(),p=g.$element.prop("selectedIndex");if(g.multiple){x.stopPropagation()}x.preventDefault();if(!g.isDisabled()&&!n.parent().hasClass("disabled")){var t=g.$element.find("option"),u=t.eq(i),k=u.prop("selected"),s=u.parent("optgroup"),z=g.options.maxOptions,q=s.data("maxOptions")||false;if(!g.multiple){t.prop("selected",false);u.prop("selected",true);g.$menuInner.find(".selected").removeClass("selected");g.setSelected(i,true)}else{u.prop("selected",!k);g.setSelected(i,!k);n.blur();if(z!==false||q!==false){var j=z<t.filter(":selected").length,m=q<s.find("option:selected").length;if((z&&j)||(q&&m)){if(z&&z==1){t.prop("selected",false);u.prop("selected",true);g.$menuInner.find(".selected").removeClass("selected");g.setSelected(i,true)}else{if(q&&q==1){s.find("option:selected").prop("selected",false);u.prop("selected",true);var w=n.parent().data("optgroup");g.$menuInner.find('[data-optgroup="'+w+'"]').removeClass("selected");g.setSelected(i,true)}else{var l=(typeof g.options.maxOptionsText==="function")?g.options.maxOptionsText(z,q):g.options.maxOptionsText,y=l[0].replace("{n}",z),o=l[1].replace("{n}",q),r=d('<div class="notify"></div>');if(l[2]){y=y.replace("{var}",l[2][z>1?0:1]);o=o.replace("{var}",l[2][q>1?0:1])}u.prop("selected",false);g.$menu.append(r);if(z&&j){r.append(d("<div>"+y+"</div>"));g.$element.trigger("maxReached.bs.select")}if(q&&m){r.append(d("<div>"+o+"</div>"));g.$element.trigger("maxReachedGrp.bs.select")}setTimeout(function(){g.setSelected(i,false)},10);r.delay(750).fadeOut(300,function(){d(this).remove()})}}}}}if(!g.multiple){g.$button.focus()}else{if(g.options.liveSearch){g.$searchbox.focus()}}if((v!=g.$element.val()&&g.multiple)||(p!=g.$element.prop("selectedIndex")&&!g.multiple)){g.$element.trigger("changed.bs.select",[i,u.prop("selected"),k]).triggerNative("change")}}});this.$menu.on("click","li.disabled a, .popover-title, .popover-title :not(.close)",function(i){if(i.currentTarget==this){i.preventDefault();i.stopPropagation();if(g.options.liveSearch&&!d(i.target).hasClass("close")){g.$searchbox.focus()}else{g.$button.focus()}}});this.$menuInner.on("click",".divider, .dropdown-header",function(i){i.preventDefault();i.stopPropagation();if(g.options.liveSearch){g.$searchbox.focus()}else{g.$button.focus()}});this.$menu.on("click",".popover-title .close",function(){g.$button.click()});this.$searchbox.on("click",function(i){i.stopPropagation()});this.$menu.on("click",".actions-btn",function(i){if(g.options.liveSearch){g.$searchbox.focus()}else{g.$button.focus()}i.preventDefault();i.stopPropagation();if(d(this).hasClass("bs-select-all")){g.selectAll()}else{g.deselectAll()}});this.$element.change(function(){g.render(false)})},liveSearchListener:function(){var h=this,g=d('<li class="no-results"></li>');this.$button.on("click.dropdown.data-api touchstart.dropdown.data-api",function(){h.$menuInner.find(".active").removeClass("active");if(!!h.$searchbox.val()){h.$searchbox.val("");h.$lis.not(".is-hidden").removeClass("hidden");if(!!g.parent().length){g.remove()}}if(!h.multiple){h.$menuInner.find(".selected").addClass("active")}setTimeout(function(){h.$searchbox.focus()},10)});this.$searchbox.on("click.dropdown.data-api focus.dropdown.data-api touchend.dropdown.data-api",function(i){i.stopPropagation()});this.$searchbox.on("input propertychange",function(){if(h.$searchbox.val()){var i=h.$lis.not(".is-hidden").removeClass("hidden").children("a");if(h.options.liveSearchNormalize){i=i.not(":a"+h._searchStyle()+'("'+f(h.$searchbox.val())+'")')}else{i=i.not(":"+h._searchStyle()+'("'+h.$searchbox.val()+'")')}i.parent().addClass("hidden");h.$lis.filter(".dropdown-header").each(function(){var l=d(this),k=l.data("optgroup");if(h.$lis.filter("[data-optgroup="+k+"]").not(l).not(".hidden").length===0){l.addClass("hidden");h.$lis.filter("[data-optgroup="+k+"div]").addClass("hidden")}});var j=h.$lis.not(".hidden");j.each(function(k){var l=d(this);if(l.hasClass("divider")&&(l.index()===j.first().index()||l.index()===j.last().index()||j.eq(k+1).hasClass("divider"))){l.addClass("hidden")}});if(!h.$lis.not(".hidden, .no-results").length){if(!!g.parent().length){g.remove()}g.html(h.options.noneResultsText.replace("{0}",'"'+e(h.$searchbox.val())+'"')).show();h.$menuInner.append(g)}else{if(!!g.parent().length){g.remove()}}}else{h.$lis.not(".is-hidden").removeClass("hidden");if(!!g.parent().length){g.remove()}}h.$lis.filter(".active").removeClass("active");if(h.$searchbox.val()){h.$lis.not(".hidden, .divider, .dropdown-header").eq(0).addClass("active").children("a").focus()}d(this).focus()})},_searchStyle:function(){var g={begins:"ibegins",startsWith:"ibegins"};return g[this.options.liveSearchStyle]||"icontains"},val:function(g){if(typeof g!=="undefined"){this.$element.val(g);this.render();return this.$element}else{return this.$element.val()}},changeAll:function(h){if(typeof h==="undefined"){h=true}this.findLis();var g=this.$element.find("option"),n=this.$lis.not(".divider, .dropdown-header, .disabled, .hidden").toggleClass("selected",h),j=n.length,m=[];for(var k=0;k<j;k++){var l=n[k].getAttribute("data-original-index");m[m.length]=g.eq(l)[0]}d(m).prop("selected",h);this.render(false);this.$element.trigger("changed.bs.select").triggerNative("change")},selectAll:function(){return this.changeAll(true)},deselectAll:function(){return this.changeAll(false)},toggle:function(g){g=g||window.event;if(g){g.stopPropagation()}this.$button.trigger("click")},keydown:function(x){var i=d(this),r=i.is("input")?i.parent().parent():i.parent(),h,m=r.data("this"),j,t,l,p,s,g,n,v,u=":not(.disabled, .hidden, .dropdown-header, .divider)",q={32:" ",48:"0",49:"1",50:"2",51:"3",52:"4",53:"5",54:"6",55:"7",56:"8",57:"9",59:";",65:"a",66:"b",67:"c",68:"d",69:"e",70:"f",71:"g",72:"h",73:"i",74:"j",75:"k",76:"l",77:"m",78:"n",79:"o",80:"p",81:"q",82:"r",83:"s",84:"t",85:"u",86:"v",87:"w",88:"x",89:"y",90:"z",96:"0",97:"1",98:"2",99:"3",100:"4",101:"5",102:"6",103:"7",104:"8",105:"9"};if(m.options.liveSearch){r=i.parent().parent()}if(m.options.container){r=m.$menu}h=d("[role=menu] li",r);v=m.$newElement.hasClass("open");if(!v&&(x.keyCode>=48&&x.keyCode<=57||x.keyCode>=96&&x.keyCode<=105||x.keyCode>=65&&x.keyCode<=90)){if(!m.options.container){m.setSize();m.$menu.parent().addClass("open");v=true}else{m.$button.trigger("click")}m.$searchbox.focus()}if(m.options.liveSearch){if(/(^9$|27)/.test(x.keyCode.toString(10))&&v&&m.$menu.find(".active").length===0){x.preventDefault();m.$menu.parent().removeClass("open");if(m.options.container){m.$newElement.removeClass("open")}m.$button.focus()}h=d("[role=menu] li"+u,r);if(!i.val()&&!/(38|40)/.test(x.keyCode.toString(10))){if(h.filter(".active").length===0){h=m.$menuInner.find("li");if(m.options.liveSearchNormalize){h=h.filter(":a"+m._searchStyle()+"("+f(q[x.keyCode])+")")}else{h=h.filter(":"+m._searchStyle()+"("+q[x.keyCode]+")")}}}}if(!h.length){return}if(/(38|40)/.test(x.keyCode.toString(10))){j=h.index(h.find("a").filter(":focus").parent());l=h.filter(u).first().index();p=h.filter(u).last().index();t=h.eq(j).nextAll(u).eq(0).index();s=h.eq(j).prevAll(u).eq(0).index();g=h.eq(t).prevAll(u).eq(0).index();if(m.options.liveSearch){h.each(function(z){if(!d(this).hasClass("disabled")){d(this).data("index",z)}});j=h.index(h.filter(".active"));l=h.first().data("index");p=h.last().data("index");t=h.eq(j).nextAll().eq(0).data("index");s=h.eq(j).prevAll().eq(0).data("index");g=h.eq(t).prevAll().eq(0).data("index")}n=i.data("prevIndex");if(x.keyCode==38){if(m.options.liveSearch){j--}if(j!=g&&j>s){j=s}if(j<l){j=l}if(j==n){j=p}}else{if(x.keyCode==40){if(m.options.liveSearch){j++}if(j==-1){j=0}if(j!=g&&j<t){j=t}if(j>p){j=p}if(j==n){j=l}}}i.data("prevIndex",j);if(!m.options.liveSearch){h.eq(j).children("a").focus()}else{x.preventDefault();if(!i.hasClass("dropdown-toggle")){h.removeClass("active").eq(j).addClass("active").children("a").focus();i.focus()}}}else{if(!i.is("input")){var o=[],k,y;h.each(function(){if(!d(this).hasClass("disabled")){if(d.trim(d(this).children("a").text().toLowerCase()).substring(0,1)==q[x.keyCode]){o.push(d(this).index())}}});k=d(document).data("keycount");k++;d(document).data("keycount",k);y=d.trim(d(":focus").text().toLowerCase()).substring(0,1);if(y!=q[x.keyCode]){k=1;d(document).data("keycount",k)}else{if(k>=o.length){d(document).data("keycount",0);if(k>o.length){k=1}}}h.eq(o[k-1]).children("a").focus()}}if((/(13|32)/.test(x.keyCode.toString(10))||(/(^9$)/.test(x.keyCode.toString(10))&&m.options.selectOnTab))&&v){if(!/(32)/.test(x.keyCode.toString(10))){x.preventDefault()}if(!m.options.liveSearch){var w=d(":focus");w.click();w.focus();x.preventDefault();d(document).data("spaceSelect",true)}else{if(!/(32)/.test(x.keyCode.toString(10))){m.$menuInner.find(".active a").click();i.focus()}}d(document).data("keycount",0)}if((/(^9$|27)/.test(x.keyCode.toString(10))&&v&&(m.multiple||m.options.liveSearch))||(/(27)/.test(x.keyCode.toString(10))&&!v)){m.$menu.parent().removeClass("open");if(m.options.container){m.$newElement.removeClass("open")}m.$button.focus()}},mobile:function(){this.$element.addClass("mobile-device")},refresh:function(){this.$lis=null;this.liObj={};this.reloadLi();this.render();this.checkDisabled();this.liHeight(true);this.setStyle();this.setWidth();if(this.$lis){this.$searchbox.trigger("propertychange")}this.$element.trigger("refreshed.bs.select")},hide:function(){this.$newElement.hide()},show:function(){this.$newElement.show()},remove:function(){this.$newElement.remove();this.$element.remove()},destroy:function(){this.$newElement.before(this.$element).remove();if(this.$bsContainer){this.$bsContainer.remove()}else{this.$menu.remove()}this.$element.off(".bs.select").removeData("mf_selectpicker").removeClass("bs-select-hidden mf_selectpicker")}};function c(j,k){var h=arguments;var m=j,g=k;[].shift.apply(h);var l;var i=this.each(function(){var r=d(this);if(r.is("select")){var q=r.data("mf_selectpicker"),o=typeof m=="object"&&m;if(!q){var n=d.extend({},b.DEFAULTS,d.fn.mf_selectpicker.defaults||{},r.data(),o);n.template=d.extend({},b.DEFAULTS.template,(d.fn.mf_selectpicker.defaults?d.fn.mf_selectpicker.defaults.template:{}),r.data().template,o.template);r.data("mf_selectpicker",(q=new b(this,n,g)))}else{if(o){for(var p in o){if(o.hasOwnProperty(p)){q.options[p]=o[p]}}}}if(typeof m=="string"){if(q[m] instanceof Function){l=q[m].apply(q,h)}else{l=q.options[m]}}}});if(typeof l!=="undefined"){return l}else{return i}}var a=d.fn.mf_selectpicker;d.fn.mf_selectpicker=c;d.fn.mf_selectpicker.Constructor=b;d.fn.mf_selectpicker.noConflict=function(){d.fn.mf_selectpicker=a;return this};d(document).data("keycount",0).on("keydown.bs.select",'.bootstrap-select_mf [data-toggle=dropdown], .bootstrap-select_mf [role="menu"], .bs-searchbox input',b.prototype.keydown).on("focusin.modal",'.bootstrap-select_mf [data-toggle=dropdown], .bootstrap-select_mf [role="menu"], .bs-searchbox input',function(g){g.stopPropagation()});d(window).on("load.bs.select.data-api",function(){d(".mf_selectpicker").each(function(){var g=d(this);c.call(g,g.data())})})})(jQuery);(function(a){a.fn.mf_selectpicker.defaults={noneSelectedText:"Nothing selected",noneResultsText:"No results match {0}",countSelectedText:function(c,b){return(c==1)?"{0} item selected":"{0} items selected"},maxOptionsText:function(b,c){return[(b==1)?"Limit reached ({n} item max)":"Limit reached ({n} items max)",(c==1)?"Group limit reached ({n} item max)":"Group limit reached ({n} items max)"]},selectAllText:"Select All",deselectAllText:"Deselect All",multipleSeparator:", "}})(jQuery);

/**
 * Mega Filter PRO/PLUS
 * 
 * @license Commercial
 * @author info@ocdemo.eu
 */

if( typeof Array.prototype.indexOf == 'undefined' ) {
	Array.prototype.indexOf = function(obj, start) {
		for( var i = ( start || 0 ), j = this.length; i < j; i++ ) {
			if( this[i] === obj ) {return i;}
		}
		
		return -1;
   };
};

var MegaFilterINSTANCES = typeof MegaFilterINSTANCES == 'undefined' ? [] : MegaFilterINSTANCES;
var MegaFilterCommonData = typeof MegaFilterCommonData == 'undefined' ? {} : MegaFilterCommonData;

var MegaFilter = function(){ };

MegaFilter.prototype = {
	
	/**
	 * Main box of filter
	 */
	_box: null,
			
	/**
	 * Ooptions
	 */
	_options: null,
			
	/**
	 * @var int
	 */
	_timeoutAjax: null,
	
	_timeoutSearchFiled: null,
		
	/**
	* @var string
	*/
	_url			: null,
	
	/**
	 * URL separator
	 * 
	 * @var string
	 */
	_urlSep			: null,
	
	/**
	 * List of parameters
	 *
	 * @var object
	 */
	_params			: null,
	
	/**
	 * List of scrolls
	 * 
	 * @var array
	 */
	_scrolls		: null,
	
	/**
	 * List of buttons
	 * 
	 * @var array
	 */
	_buttonsMore	: null,
	
	_liveFilters	: null,
	
	/**
	 * Main container
	 *
	 * @var jQuery
	 */
	_jqContent		: null,
		
	/**
	 * Loader over results
	 *
	 * @var jQuery
	 */
	_jqLoader		: null,
	
	/**
	 * Loader over filter
	 * 
	 * @var jQuery
	 */
	_jqLoaderFilter	: null,
	
	/**
	 * Sliders
	 * 
	 * @type array
	 */
	_sliders		: null,
		
	/**
	 * ID of main container
	 *
	 * @var string
	 */
	_contentId		: '#content',
	
	/**
	 * Waiting for server response
	 * 
	 * @var bool
	 */
	_busy			: false,
	
	/**
	 * Something was changed when loading data from the server
	 * 
	 * @var bool
	 */
	_waitingChanges	: false,
	
	/**
	 * Last response
	 * 
	 * @var string
	 */
	_lastResponse	: '',
	
	_refreshPrice : function(){},
	
	_inUrl : null,
	
	_isInit: false,
	
	_stockStatusInited: false,
	
	_cache: null,
	
	_relativeScroll: null,
	
	_selectOptions: null,
	
	_lastUrl: null,
	
	_urlToFilters: null,
	
	_instanceIdx: 0,
	
	_inlineHorizontalUpdate: null,
	
	_lastEvent: null,
	
	_startUrl: null,
	
	_history: 1,
	
	_changed: false,
	
	_ajaxPagination: null,
	
	_seoAliases: null,
	
	_selectedFilters: null,
	
	_page: 1,
	
	_pages: null,
	
	////////////////////////////////////////////////////////////////////////////
	
	/**
	 * Init class
	 */
	init: function( box, options ) {
		var self = this,
			i;
		
		self._instanceIdx = MegaFilterINSTANCES.length;
		
		if( options.routeHome == options.route && options.homePageAJAX ) {
			self._contentId = options.homePageContentSelector;
		} else if( options.contentSelector ) {
			self._contentId = options.contentSelector;
		}
		
		self._jqContent	= jQuery(self._contentId);
		self._options	= options;
		
		if( ! self._jqContent.length ) {
			self._contentId = '#maincontent';
			
			self._jqContent	= jQuery(self._contentId);
		}
		
		if( options.routeHome == options.route && options.homePageAJAX && box.hasClass( 'mfilter-content_top' ) && box.parents(self._contentId) ) {
			self._jqContent.parent().prepend( box.addClass('col-sm-12') );
		}
		
		if( self._startUrl === null ) {
			self._startUrl = self.location();
		}
		
		self._cache						= {};
		self._seoAliases				= {};
		self._scrolls					= [];
		self._buttonsMore				= [];
		self._liveFilters				= [];
		self._sliders					= [];
		self._inlineHorizontalUpdate	= [];
		self._box						= box;
		self._selectOptions				= {};
		
		if( typeof MegaFilterCommonData.lastResponse == 'undefined' ) {
			MegaFilterCommonData.lastResponse = {};
		}
		
		if( typeof MegaFilterCommonData.mainContent == 'undefined' ) {
			MegaFilterCommonData.mainContent = {};
		}
		
		if( self._box.tooltip ) {
			self._box.find('[data-mf-toggle="tooltip"]').tooltip({
				'viewport' : 'body',
				'container' : 'body'
			});
		}
		
		if( ! self._instanceIdx ) {
			var tmp = {};
			
			for( i in MegaFilterCommonData.seo.aliases ) {
				tmp[self.filtersToUrl( self.sortParamsForSeoAlias( self.__urlToFilters( i ) ), true )] = MegaFilterCommonData.seo.aliases[i];
			}
			
			MegaFilterCommonData.seo.aliases = tmp;
		}
		
		self.initResponsive();
		
		if( ( self._options.manualInit == '1' || ( self._options.isMobile && self._options.manualInit == 'mobile' ) || ( ! self._options.isMobile && self._options.manualInit == 'pc' ) ) && ! self._isInit ) {
			var items = self._box.find('> .mfilter-content').find('> ul,> div').hide(),
				$init = jQuery('<a href="#" class="mfp-manual-init" style="padding: 10px; text-align: center; display: block;">' + self._options.text.init_filter + '</a>').appendTo( self._box.find('> .mfilter-content') );
			
			$init.click(function(){
				$init.text( self._options.text.initializing );
				
				setTimeout(function(){
					items.show();
					self.boot();
					$init.remove();
				},100);
				
				return false;
			});
		} else {
			self.boot();
		}
		
		if( self._options.seo.valuesAreLinks ) {
			jQuery(self._box).on('click', 'a.mfp-value-link', function(e){
				if( jQuery(this).hasClass('mfp-value-link-disabled') ) {
					e.preventDefault();
					
					return;
				}
				
				if( self._options.seo.valuesLinksAreClickable ) {
					self._showLoader();
					self._busy = true;
				} else {
					e.preventDefault();
				}
				
				jQuery(this).parent().trigger('click');
			});
		}
		
		if( ! self._instanceIdx && self._options.infiniteScroll ) {
			if( typeof self._params['page'] != 'undefined' ) {
				self._page = parseInt( self._params['page'] );
			}
			
			self.updatePages();
			
			self._jqContent.infiniteScroll({
				calculateBottom: function () {
					return self.infiniteScrollCalculateBottom();
				},
				loadMore: function(){
					self.infiniteScrollLoadMore();
				}
			});
		}
		
		return self;
	},
	
	infiniteScrollCalculateBottom: function() {
		var self = this;
		
		return (self._jqContent.position().top + self._jqContent.height()) - $(window).height() + 50;
	},
	
	infiniteScrollLoadMore: function(){
		var self = this;
		
		if( self._busy ) return;
					
		if( self._pages !== null && self._page >= self._pages ) return;
		
		self._ajaxPagination = ++self._page;
		
		self.ajax( undefined, undefined, true );
	},
	
	updatePages: function(){
		var self = this,
			$pagination = jQuery(self._options.contentSelectorPagination);
			
		self._pages = 1;
		
		if( $pagination.length ) {			
			$pagination.find('a[href]:last').each(function(){
				var url = $(this).attr('href'),
					page = url.match(/page=([0-9]+)|page-([0-9]+)/);

				if( page && typeof page[1] != 'undefined' ) {
					self._pages = parseInt( page[1] );
				}
			});
		}
	},
	
	boot: function() {
		var self = this,
			i;
		
		self.initUrls();

		for( i in self._options.params ) {
			if( typeof self._options.params[i] == 'function' ) continue;

			if( typeof self._params[i] == 'undefined' ) {
				self._params[i] = self._options.params[i];
			}
		}

		self.initSliders();
		
		//var t = this.microtime(true);
		for( i in self ) {
			if( i.indexOf( '_init' ) === 0 ) {
				self[i]();
			}
		}
		//alert(this.microtime(true)-t);
		
		if( self._options.route == self._options.routeHome && self._params[self._options.seo.parameter] ) {
			setTimeout(function(){
				self.ajax();
			},50);
		}
		
		if( self._params[self._options.seo.parameter] ) {
			self.setFiltersByUrl();
		} else if( ( self._options.seo.enabled || self._options.seo.aliasesEnabled ) && self._options.seo.alias != '' ) {
			for( i in MegaFilterCommonData.seo.aliases ) {
				if( MegaFilterCommonData.seo.aliases[i] == self._options.seo.alias ) {
					self.setFiltersByUrl( self.__urlToFilters( i ) );
					
					break;
				}
			}
		} else {
			self.setFiltersByUrl();
		}
		
		self.initCountInfo();
		
		self._isInit = true;
		
		if( ! self._options.calculateNumberOfProducts && self._instanceIdx == 0 ) {
			setTimeout(function(){
				self.checkValueLinks();
			}, 500);
		}
	},
	
	microtime: function(get_as_float) {
		var now = new Date()
			.getTime() / 1000;
		var s = parseInt(now, 10);

		return (get_as_float) ? now : (Math.round((now - s) * 1000) / 1000) + ' ' + s;
	},

	keys: function( obj ) {
		var keys = [];
		
		for( var i in obj ) {
			keys.push( i );
		}
		
		return keys;
	},
	
	base64_decode: function(data) {
		var b64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
		var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,
		  ac = 0,
		  dec = '',
		  tmp_arr = [];

		if (!data) {
		  return data;
		}

		data += '';

		do {
		  h1 = b64.indexOf(data.charAt(i++));
		  h2 = b64.indexOf(data.charAt(i++));
		  h3 = b64.indexOf(data.charAt(i++));
		  h4 = b64.indexOf(data.charAt(i++));

		  bits = h1 << 18 | h2 << 12 | h3 << 6 | h4;

		  o1 = bits >> 16 & 0xff;
		  o2 = bits >> 8 & 0xff;
		  o3 = bits & 0xff;

		  if (h3 == 64) {
			tmp_arr[ac++] = String.fromCharCode(o1);
		  } else if (h4 == 64) {
			tmp_arr[ac++] = String.fromCharCode(o1, o2);
		  } else {
			tmp_arr[ac++] = String.fromCharCode(o1, o2, o3);
		  }
		} while (i < data.length);

		dec = tmp_arr.join('');

		return dec.replace(/\0+$/, '');
	},
	
	sortKeys: function( data ) {
		var keys = [],
			sortData = [],
			i;
			
		for( i in data ) {
			sortData.push( [ i, data[i] ] );
		}
		
		sortData.sort(function(a,b){
			var sa = typeof a[1].sort_order == 'undefined' ? 0 : a[1].sort_order,
				sb = typeof b[1].sort_order == 'undefined' ? 0 : b[1].sort_order;
			
			if( sa > sb ) {
				return 1;
			} else if( sa < sb ) {
				return -1;
			}
			
			return 0;
		});
		
		for( i = 0; i < sortData.length; i++ ) {
			keys.push( sortData[i][0] );
		}
		
		return keys;
	},
	
	urldecode: function(str) {
	  return decodeURIComponent((str + '')
		.replace(/%(?![\da-f]{2})/gi, function () {
			return '%25';
		})
		.replace(/\+/g, '%20'));
	},
	
	/**
	 * Init sliders
	 * 
	 * @return void
	 */
	initSliders: function(){
		var self = this,
			_init = false;
		
		function d( txt ) {
			var $i = jQuery('<div>').html( txt ),
				txt2 = $i.text();
			$i.remove();
			return txt2;
		}
		
		self._box.find('li.mfilter-filter-item.mfilter-slider').each(function(i){
			var _this		= jQuery(this).attr('data-slider-id', i),
				seo_name	= _this.attr('data-seo-name'),
				data		= jQuery.parseJSON(self.base64_decode(_this.find('.mfilter-slider-data').html())),
				$min		= _this.find('.mfilter-opts-slider-min'),
				$max		= _this.find('.mfilter-opts-slider-max'),
				$slider		= _this.find('.mfilter-slider-slider'),
				update		= false,
				keys, values, map;
				
			function init( data, update ) {
				if( update ) {
					return;
				}
				
				keys	= self.sortKeys( data );
				
				if( _init ) {
					if( ! keys.length ) {
						$slider.slider().slider('disable');

						return;
					} else {
						$slider.slider().slider('enable');
					}
				}
				
				if( keys.length == 1 ) {
					data['copy'] = data[keys[0]];
					keys.push('copy');
				}
				
				var params = self._parseUrl( document.location.href.toString(), {'x':'x'} ),
					filters = {};
				
				if( typeof params[self._options.seo.parameter] != 'undefined' ) {
					filters = self.__urlToFilters( decodeURIComponent( params[self._options.seo.parameter] ) );
				}
				
				//var filters = /*update ? self.filters() :*/ self.urlToFilters();
				
				values	= typeof filters[seo_name] != 'undefined' ? (function(){ 
					var d = [];
					
					for( var i = 0; i < filters[seo_name].length; i++ ) {
						d[i] = self.decode( self.urldecode( filters[seo_name][i] ) );
					} 
					
					return d;
				})() : [ data[keys[0]].key, data[keys[keys.length-1]].key ];
				map		= (function(){
					var m = [ keys.indexOf( values[0] ), keys.indexOf( values[values.length-1] ) ];

					if( m[0] != -1 && m[1] != -1 ) {
						return typeof filters[seo_name] == 'undefined' ? [ 0, keys.length-1 ] : m;
					}

					for( var i = 0; i < keys.length; i++ ) {
						if( m[0] == -1 ) {
							if( values[0] == d( data[keys[i]].value ) ) {
								m[0] = i;
							}
						} else if( m[1] == -1 ) {
							if( values[values.length-1] == d( data[keys[i]].value ) ) {
								m[1] = typeof data['copy'] == 'undefined' ? i : ( typeof filters[seo_name] == 'undefined' ? 1 : m[0] );
							}
						} else {
							break;
						}
					}
					
					if( m[0] == -1 ) {
						m[0] = 0;
					}

					if( m[1] == -1 ) {
						m[1] = m[0];//keys.length-1;
					}

					return m;
				})();
				
				$min.attr('data-key',map[0]).attr('data-min',0).val( d( data[keys[map[0]]].name ) );
				$max.attr('data-key',map[1]).attr('data-max',keys.length-1).val( d( data[keys[map[1]]].name ) );
				
				$slider.slider({
					range	: true,
					min		: 0,
					max		: keys.length-1,
					values	: map,
					isRTL	: self._options.direction == 'rtl',
					slide	: function( e, ui ) {
						$slider.trigger('slidechange', ui);
					},
					stop	: function( e, ui ) {
						update = true;
						
						self.runAjaxIfPossible();
					}
				}).bind('slidechange', function(e, ui){
					if( typeof keys[ui.values[0]] == 'undefined' || typeof data[keys[ui.values[0]]] == 'undefined' )
						return;

					if( typeof keys[ui.values[1]] == 'undefined' || typeof data[keys[ui.values[1]]] == 'undefined' )
						return;

					$min.attr('data-key',ui.values[0]).val( d( data[keys[ui.values[0]]].name ) );
					$max.attr('data-key',ui.values[1]).val( d( data[keys[ui.values[1]]].name ) );
				});
				
				if( _init ) {
					$slider.slider( 'value', $slider.slider('value') );
				}
				
				_init = true;
			}
			
			init( data );
			
			var s_idx = self._sliders.length;
			
			self._sliders.push({
				data: data,
				init: function( data, update ) {
					init( data, update );
				},
				resetValues: function(){
					data = self._sliders[s_idx].data;
					keys = self.sortKeys( data );
					
					$min.attr('data-key',0).attr('data-min',0).val( d( data[keys[map[0]]].name ) );
					$max.attr('data-key',keys.length-1).attr('data-max',keys.length-1).val( d( data[typeof keys[map[1]] != 'undefined' ? keys[map[1]] : keys[map[0]]].name ) );
					
					$slider.slider( 'option', 'min', parseInt( $min.attr('data-min') ) );
					$slider.slider( 'option', 'max', parseInt( $max.attr('data-max') ) );
					$slider.slider( 'option', 'values', [
						$min.attr('data-min'),
						$max.attr('data-max')
					]);
					$slider.slider( 'value', $slider.slider( 'value' ) );
					
					update = true;
				},
				setValues: function( values ){
					var vals = typeof values != 'undefined' ? (function(){
						var min = null,
							max = null,
							i = 0;
						
						for( var j in data ) {
							if( data[j].value == values[0] ) {
								min = i;
							}
							
							if( data[j].value == values[values.length-1] ) {
								max = i;
							}
							
							if( min !== null && max !== null ) {
								break;
							}
							
							i++;
						}
						
						return [ min === null ? 0 : min, max === null ? keys.length-1 : max ];
					})( values ) : $slider.slider('values');
					
					$min.attr('data-key',vals[0]).val( d( data[keys[vals[0]]].name ) );
					$max.attr('data-key',vals[1]).val( d( data[typeof keys[map[1]] != 'undefined' ? keys[map[1]] : keys[map[0]]].name ) );
					
					$slider.slider('values', vals);
				},
				getValues: function(){
					if( $min.attr('data-key') == $min.attr('data-min') && $max.attr('data-key') == $max.attr('data-max') && self.keys( data ).length == self.keys( self._sliders[s_idx].data ).length ) {
						return [];
					}
					
					var min		= parseInt( $min.attr('data-key') ),
						max		= parseInt( $max.attr('data-key') ),
						vals	= [];
					
					for( var i = min; i <= max; i++ ) {
						var key = keys[i];
						
						if( ! key ) continue;
						
						if( typeof data[key] == 'undefined' ) {
							key = keys[0];
						}
						
						vals.push( encodeURIComponent( self.encode( d( data[key].value ) ) ) );
					}
					
					return vals;
				}
			});
		});
	},
	
	initResponsive: function(){
		var self	= this,
			column	= null,
			moved	= false,
			hidden	= true;
	
		if( self._box.hasClass( 'mfilter-hide-container' ) ) {
			column = self._box.parent();
			self._box.removeClass( 'mfilter-content_top mfilter-modern-horizontal mfilter-hide' );
		} else if( self._box.hasClass( 'mfilter-column_left' ) ) {
			column = jQuery('#column-left');
		} else if( self._box.hasClass( 'mfilter-column_right' ) ) {
			column = jQuery('#column-right');
		} else {
			return;
		}
		
		var id = 'mfilter-free-container-' + self.widgetPosition() + '-' + jQuery('[id^="mfilter-free-container"][data-position="' + self.widgetPosition() + '"]').length,
			locked = false,
			control = false,
			src = jQuery('<span class="mfilter-before-box">'),
			cnt, cnt2, cnt3, btn;
		
		if( ! jQuery( '.mfilter-free-container.mfilter-widget-position-' + self.widgetPosition() ).length ) {
			control = true;
			
			cnt = jQuery('<div class="mfilter-free-container mfilter-free-container-closed mfilter-widget-position-' + self.widgetPosition() + ' mfilter-direction-' + self._options.direction + ( self._options.isMobile ? ' mfilter-mobile' : '' ) + ' mfilter-box-' + ( self._instanceIdx + 1 ) + '" data-position="' + self.widgetPosition() + '">')
				.prependTo( jQuery('body') );
			
			btn = jQuery('<div class="mfilter-free-button">')
				.appendTo( cnt )
				.click(function(){
					if( locked ) return false;
				
					locked = true;
				
					if( hidden ) {
						if( ( self._options.manualInit == '1' || ( self._options.isMobile && self._options.manualInit == 'mobile' ) || ( ! self._options.isMobile && self._options.manualInit == 'pc' ) ) && self._box.find('.mfp-manual-init').length ) {
							self._box.find('.mfp-manual-init').trigger('click');
						}
						
						cnt.animate(self.widgetPosition() == 'right' ? {
							'marginRight' : 0
						} : {
							'marginLeft' : 0
						}, 500, function(){
							locked = false;
							
							self._relativeScroll.refresh();
							cnt.addClass('mfilter-free-container-opened').removeClass('mfilter-free-container-closed');
							
							for( var i in self._scrolls ) {
								if( typeof self._scrolls[i] != 'undefined' && typeof self._scrolls[i].refresh == 'function' ) {
									self._scrolls[i].refresh();
								}
							}
						});
					} else {
						cnt.animate(self.widgetPosition() == 'right' ? {
							'marginRight' : - ( cnt.outerWidth(true)<cnt.outerWidth()?cnt.outerWidth():cnt.outerWidth(true) )
						} : {
							'marginLeft' : - cnt.outerWidth(true)
						}, 500, function(){
							locked = false;
							
							cnt.addClass('mfilter-free-container-closed').removeClass('mfilter-free-container-opened');
							
							jQuery('body > div.tooltip.fade.top.in').remove();
						});
					}
			
					hidden = ! hidden;
				});
			
			cnt2 = jQuery('<div class="mfilter-iscroll">')
				.css('overflow','hidden')
				.attr('id', id)
				.appendTo( cnt );
			
			cnt3 = jQuery('<div>')
				.appendTo( cnt2 );
		} else {
			cnt = jQuery( '.mfilter-free-container.mfilter-widget-position-' + self.widgetPosition() );
			cnt2 = cnt.find( '.mfilter-iscroll:first' );
			cnt3 = cnt2.find( '> div:first' );
			btn = jQuery( '.mfilter-free-button ');
		}
		
		function reinit() {
			var init = false,
				$self = jQuery('#'+id);
			
			return {
				refresh : function(){
					if( init ) {
						return;
					}
					
					init = true;
					
					$self.scrollbar();
				},
				reinit: function(){
					
				}
			};
		}
		
		if( control ) {
			self._relativeScroll = reinit();
		}
		
		self._box.before( src );
		
		if( ! column.length ) {
			column = self._box.parent();
		}
		
		function isVisible() {
			var displayAlwaysAsWidget = self._options.displayAlwaysAsWidget;
			
			/*self.eachInstances(function( instance ){
				if( ! displayAlwaysAsWidget && instance.widgetPosition() == self.widgetPosition() ) {
					displayAlwaysAsWidget = instance._options.displayAlwaysAsWidget;
				}
			});*/
			
			var visible = self._options.displayAlwaysAsWidget ? false : column.is(':visible'),
				height	= (window.innerHeight||jQuery(window).height()) - 50;
			
			if( displayAlwaysAsWidget ) {
				cnt.show();
			}
			
			if( visible && moved ) {
				if( control ) {
					cnt.hide();
				}
				
				src.after( self._box );
				
				if( control ) {
					if( ! hidden ) {
						btn.trigger('click');
					}
				}
				
				moved = false;
			} else if( ! visible && ! moved ) {
				if( control ) {
					cnt.show();
				}
				
				cnt3.append( self._box );
				
				moved = true;
			}
			
			if( displayAlwaysAsWidget || control ) {
				if( moved ) {
					self.eachInstances(function( self ){
						if( self._relativeScroll ) {
							cnt2.attr('data-max-height', height).css( 'max-height', height + 'px' );
							self._relativeScroll.refresh();
						}
					});
				}
			}
		}
		
		jQuery(window).resize(function() {
			isVisible();
		});
		
		setTimeout(function(){
			isVisible();
		},100);
		
		if( control ) {
			if( self._options.isMobile && self._options.widgetWithSwipe ) {
				self.swipe = function( e, direction, distance, duration, fingerCount, fingerData ){
					if( direction != 'left' && direction != 'right' ) return;
					
					if( ( self.widgetPosition() == 'right' && direction == 'left' ) || ( self.widgetPosition() == 'left' && direction == 'right' ) ) {
						if( hidden ) {
							btn.trigger('click');
						}
					} else if( ( self.widgetPosition() == 'right' && direction == 'right' ) || ( self.widgetPosition() == 'left' && direction == 'left' ) ) {
						if( ! hidden ) {
							btn.trigger('click');
						}
					}
				};
				
//				jQuery(document).hammer({
//					direction: Hammer.DIRECTION_HORIZONTAL
//				}).bind('panright panleft', function(e){
//					if( ( self.widgetPosition() == 'right' && e.type == 'panleft' ) || ( self.widgetPosition() == 'left' && e.type == 'panright' ) ) {
//						if( hidden ) {
//							btn.trigger('click');
//						}
//					} else if( ( self.widgetPosition() == 'right' && e.type == 'panright' ) || ( self.widgetPosition() == 'left' && e.type == 'panleft' ) ) {
//						if( ! hidden ) {
//							btn.trigger('click');
//						}
//					}
//				});
			}
		}
	},
	
	swipe: function(){},
	
	widgetPosition: function() {
		var self = this;
		
		if( self._options.widgetPosition != '' ) {
			return self._options.widgetPosition;
		}
		
		return self._options.direction == 'rtl' ? 'right' : 'left';
	},
	
	location: function(){
		var self = this,
			url = document.location.href.toString().split('#')[0],
			query = '',
			last_was_empty = false;
		
		if( url.indexOf('?') > -1 ) {
			query = '?' + url.split('?')[1];
			url = url.split('?')[0];
		}
		
		var parts = url.split('/'),
			last_part = parts.pop();
			
		if( last_part == '' ) {
			last_was_empty = true;
		}
		
		while( last_part == '' && parts.length ) {
			last_part = parts.pop();
		}
		
		if( self._options.seo.alias != '' ) {
			last_part = last_part.replace( encodeURIComponent( self._options.seo.alias ), '' );
		}
		
		for( var i in self._seoAliases ) {
			if( encodeURIComponent( self._seoAliases[i] ) == last_part ) {
				last_part = '';
			}
		}
		
		parts.push(last_part);
		
		return parts.join('/') + ( last_was_empty || self._options.seo.addSlashAtTheEnd ? '/' : '' ) + query;
	},
	
	reg_exp_quote: function(str, delimiter) {
		return (str + '').replace(new RegExp('[.\\\\+*?\\[\\^\\]$(){}=!<>|:\\' + (delimiter || '') + '-]', 'g'), '\\$&');
	},
	
	removeMfpFromUrl: function( url ) {
		var self = this,
			reg = new RegExp("/" + self.reg_exp_quote(self._options.seo.parameter) + ",([a-z0-9\\-_]+\\[[^\\]]*\\],?)+", "g");
		
		if( url.match( reg ) ) {
			return url.replace( reg, '' );
		} else {	
			var reg2 = new RegExp("(\\?|&)" + self.reg_exp_quote(self._options.seo.parameter) + "=([a-z0-9\\-_]+\\[[^\\]]*\\],?)+", "g");

			if( url.match( reg2 ) ) {
				return url.replace( reg2, '' );
			} else {
				url = url.replace( new RegExp("/" + self.reg_exp_quote(self._options.seo.separator) + "/([a-z0-9\\-_]+,[^\\/\\?]+\\/?)+"), '/' );
			}
		}
		
		url = url.replace( /\/+$/, '' );
		
		return url;
	},
	
	locationPath: function(){
		var self = this,
			location = self.location();
		
		return self.removeMfpFromUrl( decodeURIComponent( self.parse_url( location ).path ) );
	},
	
	initUrls: function( url ) {
		var self = this;

		if( typeof url == 'undefined' ) {
			url	 = self.location().split('#')[0];
		}
		
		self._urlSep	= self._parseSep( url ).urlSep;
		self._url		= self._parseSep( url ).url;
		self._params	= self._parseUrl( url );
		self._inUrl		= self._parseUrl( url );
	},
	
	_initMfImage: function() {
		var self = this;
		
		self._box.find('.mfilter-image input').change(function(){
			var s = jQuery(this).is(':checked'),
				t = jQuery(this).attr('type');
				
			if( t == 'radio' ) {
				jQuery(this).parent().parent().find('.mfilter-image-checked').removeClass('mfilter-image-checked');
			}
			
			jQuery(this).parent()[s?'addClass':'removeClass']('mfilter-image-checked');
		});
		
		self._box.find('.mfilter-image input:checked').parent().addClass('mfilter-image-checked');
	},
	
	__initTreeCategoryEvents: function() {
		var self = this,
			$path = self._box.find('input[name="path"]');
		
		self._box.find('li.mfilter-filter-item.mfilter-tree.mfilter-categories')[self._box.find('.mfilter-category-tree > ul > li').length?'show':'hide']();
			
		self._box.find('.mfilter-category-tree').each(function(){
			var _this = jQuery(this),
				ul = _this.find('> ul'),
				top_url = ul.attr('data-top-url'),
				top_path = (typeof self._options.params['path'] == 'undefined'?'':self._options.params['path']).split('_');
		
			_this.find('.mfilter-to-parent a:not(.mfp-value-link)').unbind('click').bind('click', function(){
				var parts = (jQuery(this).attr('data-path')?jQuery(this).attr('data-path'):$path.val()).split('_'),
					count = parts.length - 1;

				parts.pop();
				
				if( self._path() == parts.join('_') && self._options.params.path ) {
					parts = [];
				}
				
				if( top_url != '' && count < top_path.length ) {
					window.location.href = self.createUrl(top_url);
				} else {
					$path.val( parts.length || ! self._options.params.path ? parts.join('_') : self._path() );

					self.runAjax();
				}

				return false;
			});
				
			_this.find('a[data-parent-id]').click(function(){
				if( self._busy ) return false;

				var id = jQuery(this).attr('data-id'),
					href = jQuery(this).attr('href'),
					path = $path.val(),
					parts = path.split('_'),
					last = parts[parts.length-1].split(',');
				
				if( href != '#' && typeof href != 'undefined' ) {
					return;
				}
					
				self._cache['cat_'+id] = jQuery(this).text();
				
				if( last.indexOf( id ) == -1 ) {				
					if( path != '' ) {
						path += '_';
					}

					path += id;
				
					$path.val( path );
				}
				
				self.runAjax();

				return false;
			});
		});
	},
	
	_path: function( skip_org ){
		var self = this;
		
		if( skip_org !== true && typeof self._options.params.mfp_org_path_aliases != 'undefined' && self._options.params.mfp_org_path_aliases != '' ) {
			return self._options.params.mfp_org_path_aliases;
		} else if( skip_org !== true && typeof self._options.params.mfp_org_path != 'undefined' && self._options.params.mfp_org_path != '' ) {
			return self._options.params.mfp_org_path;
		} else if( typeof self._options.params.mfp_path_aliases != 'undefined' && self._options.params.mfp_path_aliases != '' ) {
			return self._options.params.mfp_path_aliases;
		} else if( typeof self._options.params.mfp_path != 'undefined' && self._options.params.mfp_path != '' ) {
			return self._options.params.mfp_path;
		} else if( typeof self._options.params.path_aliases != 'undefined' && self._options.params.path_aliases != '' ) {
			return self._options.params.path_aliases;
		} else if( typeof self._options.params.path != 'undefined' ) {
			return self._options.params.path;
		}
		
		return '';
	},
	
	_initTreeCategory: function( force ) {
		var self = this,
			$path = self._box.find('input[name="path"]');
		
		if( self._isInit && force !== true ) {
			self.__initTreeCategoryEvents();
			
			return;
		}
		
		if( ! $path.val() && ! self._isInit ) {
			$path.val( self._path( true ) );
		}
		
		self._box.find('.mfilter-filter-item.mfilter-tree').each(function(){
			var _this = jQuery(this);
			
			_this.find('.mfilter-category-tree').each(function(){
				var _this2 = jQuery(this),
					top_url = _this.find('[data-top-url]'),
					filters = self.filters();

				if( ( typeof filters.path != 'undefined' && filters.path != self._path() ) || $path.val().indexOf( '_' ) > -1 || ( $path.val() && ! self._options.params.path ) || ( $path.val() && self._options.route != self._options.routeCategory ) ) {
					_this2.find('ul').prepend(jQuery('<li class="mfilter-to-parent">')
						.append(jQuery('<a>')
							.addClass(_this.attr('data-normal-links')=='1'?'mfp-value-link':'')
							.attr('href', (top_url.length?top_url.attr('data-top-url'):'')||'#')
							.html((function(){
								var parts = $path.val().split('_'),
									cat = parts[parts.length-1];

								return typeof self._cache['cat_'+cat] != 'undefined' ? self._cache['cat_'+cat] : self._options.text.go_to_top;
							}))
						)
					);
				}
			});
		});
		
		self.__initTreeCategoryEvents();
	},
	
	_initBox: function() {
		var self = this;
		
		if( self._isInit ) return;
		
		if( self._box.hasClass( 'mfilter-content_top' ) ) {
			self._box.find('.mfilter-content > ul > li').each(function(i){
				if( i && i % 4 == 0 ) {
					jQuery(this).before('<li style="clear:both; display:block;"></li>');
				}
			});
		}
	},
	
	_initTextFields: function() {
		var self = this;
		
		self._box.find('.mfilter-filter-item.mfilter-text').each(function(){
			var _this	= jQuery(this),
				name	= _this.attr('data-seo-name'),
				input	= _this.find('input[type=text]');
				
			function clear() {
				if( self._cache['txt_field_'+name] ) {
					clearTimeout( self._cache['txt_field_'+name] );
				}
				
				self._cache['txt_field_'+name] = null;
			}
				
			input.bind('keydown', function(e){
				if( e.keyCode == 13 ) {
					clear();
					
					self.ajax();
					
					return false;
				}
			}).bind('keyup.mf_shv', function(){
				input[input.val()?'addClass':'removeClass']('mfilter-text-has-value');
			}).bind('keyup', function(e){
				clear();
				
				if( self._options['refreshResults'] != 'using_button' ) {
					self._cache['txt_field_'+name] = setTimeout(function(){
						self.ajax();

						self._cache['txt_field_'+name] = null;
					}, 1000);
				} else if( self._options['usingButtonWithCountInfo'] && self._options['calculateNumberOfProducts'] ) {
					self._cache['txt_field_'+name] = setTimeout(function(){
						self._ajaxGetInfo([], true, true);

						self._cache['txt_field_'+name] = null;
					}, 1000);
				}
			}).trigger('keyup.mf_shv');
		});
	},
	
	_initSearchFiled: function() {
		var self = this,
			searchField = self._box.find('input[id="mfilter-opts-search"]'),
			searchButton = self._box.find('[id="mfilter-opts-search_button"]');
			
		if( ! searchField.length )
			return;
			
		var refreshDelay = parseInt( searchField.unbind('keyup keydown click paste propertychange').attr('data-refresh-delay').toString().replace(/[^0-9\-]+/, '') ),
			lastValue = searchField.val(),
			eventTimeout = null;
		
		function clearInt() {
			if( self._timeoutSearchFiled )
				clearTimeout( self._timeoutSearchFiled );
			
			self._timeoutSearchFiled = null;
		}
		
		if( refreshDelay != '-1' ) {
			searchField.bind('keyup paste propertychange', function(e){
				var $self = jQuery(this);
				
				clearTimeout( eventTimeout );
				
				eventTimeout = setTimeout(function(){
					if( $self.val() == lastValue )
						return;

					if( ! refreshDelay ) {
						self.runAjaxIfPossible();
					} else if( e.keyCode != 13 ) {
						clearInt();

						self._timeoutSearchFiled = setTimeout(function(){
							self.runAjaxIfPossible();

							self._timeoutSearchFiled = null;
						}, refreshDelay);
					}

					lastValue = searchField.val();
					eventTimeout = null;
				},10);
			});
		}
		
		searchField.bind('keydown', function(e){
			if( e.keyCode == 13 ) {
				$(this).trigger('change');
				
				return false;
			}
		}).bind('change',function(){
			if( jQuery(this).val() != lastValue ) {
				clearInt();
			
				self.runAjaxIfPossible();
			}
		}).bind('resetvalue',function(){
			lastValue = jQuery(this).val();
		}).bind('keyup.mf_shv', function(){
			jQuery(this)[jQuery(this).val()?'addClass':'removeClass']('mfilter-search-has-value');
		}).trigger('keyup.mf_shv');
	
		searchButton.bind('click', function(){
			clearInt();
			
			self.ajax();
			
			return false;
		});
	},
	
	encode: function( string ) {
		string = string.replace( /,/g, 'LA==' );
		string = string.replace( /\[/g, 'Ww==' );
		string = string.replace( /\]/g, 'XQ==' );
		string = string.replace( /"/g, 'Ig==' );
		string = string.replace( /'/g, 'Jw==' );
		string = string.replace( /&/g, 'Jg==' );
		string = string.replace( /\//g, 'Lw==' );
		string = string.replace( /\+/g, 'Kw==' );
		string = string.replace( /%/g, 'JQ==' );
		string = string.replace( /;/g, 'Ow==' );
		string = string.replace( /:/g, 'Og==' );
		string = string.replace( /</g, 'PA==' );
		string = string.replace( />/g, 'Pg==' );
		string = string.replace( /#/g, 'Iw==' );
		string = string.replace( /\?/g, 'Pw==' );
		
		return string;
	},
	
	decode: function( string ) {
		string = string.replace( /LA==/g, ',' );
		string = string.replace( /Ww==/g, '[' );
		string = string.replace( /XQ==/g, ']' );
		string = string.replace( /Ig==/g, '"' );
		string = string.replace( /Jw==/g, "'" );
		string = string.replace( /Jg==/g, '&' );
		string = string.replace( /Lw==/g, '/' );
		string = string.replace( /Kw==/g, '+' );
		string = string.replace( /JQ==/g, '%' );
		string = string.replace( /Ow==/g, ';' );
		string = string.replace( /Og==/g, ':' );
		string = string.replace( /PA==/g, '<' );
		string = string.replace( /Pg==/g, '>' );
		string = string.replace( /Iw==/g, '#' );
		string = string.replace( /Pw==/g, '?' );
		
		return string;
	},
	
	_parseSep: function( url ) {
		var self = this,
			urlSep = null;
		
		if( typeof url == 'undefined' )
			url = self._url;
		
		if( ! self._options.smp.isInstalled || self._options.smp.disableConvertUrls ) {
			url		= self.parse_url( url );
			url		= ( url.scheme && url.host ? url.scheme + ':' : '' ) + ( url.host ? '//' + url.host : '' ) + (url.port ? ':'+url.port: '') + url.path;
			url		= url.split('&')[0];
		} else {
			url		= url.indexOf('?') > -1 ? url.split('?')[0] : url.split(';')[0];
		}
		
		urlSep	= {
			'f' : '?',
			'n' : '&'
		};
		
		return {
			url : url,
			urlSep : urlSep
		};
	},
	
	/**
	 * Init content
	 */
	_initContent: function() {
		var self = this;
		
		self._jqContent
			.css('position', 'relative');
	},
	
	/**
	 * @return {scheme: 'http', host: 'hostname', user: 'username', pass: 'password', path: '/path', query: 'arg=value', fragment: 'anchor'}
	 */
	parse_url: function(str, component) {
		var query, key = ['source', 'scheme', 'authority', 'userInfo', 'user', 'pass', 'host', 'port',
			'relative', 'path', 'directory', 'file', 'query', 'fragment'
			],
			ini = (this.php_js && this.php_js.ini) || {},
			mode = (ini['phpjs.parse_url.mode'] &&
			ini['phpjs.parse_url.mode'].local_value) || 'php',
			parser = {
			php: /^(?:([^:\/?#]+):)?(?:\/\/()(?:(?:()(?:([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?()(?:(()(?:(?:[^?#\/]*\/)*)()(?:[^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
			strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/,
			loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/\/?)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/ // Added one optional slash to post-scheme to catch file:/// (should restrict this)
			};

		var m = parser[mode].exec(str),
			uri = {},
			i = 14;
		while (i--) {
			if (m[i]) {
			uri[key[i]] = m[i];
			}
		}

		if (component) {
			return uri[component.replace('PHP_URL_', '')
			.toLowerCase()];
		}
		if (mode !== 'php') {
			var name = (ini['phpjs.parse_url.queryKey'] &&
			ini['phpjs.parse_url.queryKey'].local_value) || 'queryKey';
			parser = /(?:^|&)([^&=]*)=?([^&]*)/g;
			uri[name] = {};
			query = uri[key[12]] || '';
			query.replace(parser, function($0, $1, $2) {
			if ($1) {
				uri[name][$1] = $2;
			}
			});
		}
		delete uri.source;
		return uri;
	},
	
	baseTypes: function( skip ) {
		var self	= this,
			types	= [];
		
		function find( self ) {
			self._box.find('[data-base-type]').each(function(){
				var baseType = jQuery(this).attr('data-base-type'),
					type = jQuery(this).attr('data-type');
					
				if( baseType == 'categories' ) {
					baseType += ':' + type;
				}

				if( types.indexOf( baseType ) > -1 ) return;
				if( typeof skip != 'undefined' && skip.indexOf( baseType ) > -1 ) return;
				
				if( type == 'text' ) return;
				
				types.push( baseType );
			});
		}
		
		find( self );
		
		for( var i = 0; i < MegaFilterINSTANCES.length; i++ ) {
			if( i == self._instanceIdx ) continue;
			
			find( MegaFilterINSTANCES[i] );
		}
		
		return types;
	},
	
	_ajaxUrl: function( url ) {
		//if( this.parse_url( document.location.toString() ).scheme == 'https' && this.parse_url( url ).scheme == 'http' ) {
		//	url = url.replace( 'http://', 'https://' );
		//}
		
		url = url.replace( /^https?:\/\//, '//' );
		//url = this.removeMfpFromUrl( url );
		
		var self = this,
			params = url.indexOf('?') > -1 ? url.split('?')[1] : '',
			parts = ( url.indexOf('?') > -1 ? url.split('?')[0] : url ).split('/');
		
		for( i = 0; i < parts.length; i++ ) {
			if( /^page-[0-9]+$/.test( parts[i] ) ) {
				delete parts[i];
			} else if( i > 0 && /^[0-9]+$/.test( parts[i] ) && parts[i-1] == 'page' ) {
				delete parts[i];
				delete parts[i-1];
			}
		}
		
		url = parts.join('/');
		//url = url.replace('://', '###URL###');
		url = url.replace( /\/+$/g, '/' );
		//url = url.replace('###URL###', '://');
		
		if( params != '' ) {
			url += '?' + params;
		}
		
		if( self._options.mijoshop ) {
			return url + ( url.indexOf('?') > -1 ? '&' : '?' ) + 'option=com_mijoshop&format=raw';
		}
		
		if( self._options.jcart ) {
			if( url.indexOf('module/mega_filter/getajaxinfo') > -1 ) {
				var site_url 	= parse( self._options.jcart.site_url ),
					query		= self.parse_url( url ).query;
				
				return site_url + 'index.php?route=module/mega_filter/getajaxinfo' + ( query ? '&' + query : '' ) + '&format=raw';
			}
		}
		
		if( self._options.joo_cart != false ) {
			function parse( u ) {
				u = u.replace( 'index.php', '' );
				u = u.replace( /\/$/, '' );
				
				return u + '/';
			}
		
			var site_url 	= parse( self._options.joo_cart.site_url ),
				main_url 	= parse( self._options.joo_cart.main_url ),
				route 		= url.indexOf( 'index.php' ) > -1 ? self._parseUrl( url, {} ).route : url.replace( main_url, '' ),
				query		= self.parse_url( url ).query;
			
			if( typeof route == 'undefined' ) {
				route = '';
			}
			
			if( typeof query == 'undefined' ) {
				query = '';
			}
			
			if( route.indexOf('?') > -1 ) {
				route = route.split('?')[0];
			}
			
			if( route == 'module/mega_filter/getajaxinfo' ) {
				return site_url + 'index.php?route=' + route + ( query ? '&' + query : '' ) + '&option=com_opencart&format=raw';
			}
		}
		
		return url;
	},
	
	getToPost: function( url ) {
		var self = this,
			data = {};
		
		if( self._options.seo.enabled && self._options.seo.usePostAjaxRequests ) {
			var data = self._parseUrl(decodeURIComponent(url), {}),
				getajaxinfo = ( typeof data.route != 'undefined' && data.route == 'module/mega_filter/getajaxinfo' ) || ( ! data.route && url.indexOf( 'module/mega_filter/getajaxinfo' ) > -1 ),
				u = self.parse_url( getajaxinfo ? url : self.location() ),
				path = u.path ? self.removeMfpFromUrl(u.path) : '',
				get = [],
				mfp = typeof data[self._options.seo.parameter] != 'undefined' && self._options.seo.enabled && path ? 
					self.filtersToUrl( self.sortParamsForSeoAlias( self.__urlToFilters( data[self._options.seo.parameter] ) ), true ) : '';
			
			url = ( u.scheme && u.host ? u.scheme + ':' : '' ) + ( u.host ? '//' + u.host : '' ) + (u.port ? ':'+u.port: '') + path;
			
			for( var i in data ) {
				if( i == self._options.seo.parameter && path && path != '/index.php' ) {
					url = url.replace(/\/$/, '');
					
					if( typeof MegaFilterCommonData.seo.aliases[mfp] != 'undefined' ) {
						url += '/' + MegaFilterCommonData.seo.aliases[mfp];
					} else {
						url += '/' + self._options.seo.separator + '/' + data[i];
					}
				} else if( ! (
						[ 
							'mfilterBTypes', 
							'mfilterIdx', 
							'mfilterLPath', 
							'mfilterRoute', 
							'path_aliases', 
							'mfp_org_path', 
							'mfp_org_path_aliases', 
							'mfp_path', 
							'mfp_path_aliases', 
							self._options.seo.separator 
						].indexOf( i ) >= 0 ||
						( getajaxinfo && i == 'path' )
					)
				) {
					get.push( i + '=' + data[i] );
					
					delete data[i];
				}
			}
			
			if( self._options.seo.addSlashAtTheEnd && url.indexOf('index.php') < 0 && ! /\/$/.test( url ) ) {
				url += '/';
			}
			
			if( get.length ) {
				url += '?' + get.join('&');
			}
		}
		
		return {
			url: url,
			data: data
		};
	},
	
	_ajaxGetInfo: function( baseTypes, showLoader, renderSelectedFilters ){
		var self = this;
		
		setTimeout(function(){
			var url = self.getToPost( self._ajaxUrl( self.createUrl( self._options.ajaxGetInfoUrl, jQuery.extend( {}, self._params ), true ) ) ),
				data = jQuery.extend( url.data, {
					'mfilterIdx'	: self._options.idx,
					'mfilterRoute'	: self._options.route,
					'mfilterBTypes'	: self.baseTypes( baseTypes ).join(','),
					'mfilterLPath'	: self.locationPath()
				});

			if( showLoader ) {
				self._showLoader( true );
			}

			jQuery.ajax({
				'url'		: url.url,
				'type'		: self._options.seo.enabled && self._options.seo.usePostAjaxRequests ? 'POST' : 'GET',
				'data'		: data,
				'success'	: function( response ) {
					var $tmp = jQuery('<tmp>').html( response );

					if( showLoader ) {
						self._hideLoader();
					}

					self._parseInfo( self.base64_decode($tmp.find('#mfilter-json').html()) );

					self.checkValueLinks();

					if( renderSelectedFilters ) {
						self.renderSelectedFilters();
					}
				},
				'error'		: function() {

				}
			});
		}, 50);
	},
	
	/**
	 * Init info about counts
	 */
	initCountInfo: function() {
		var self = this;
		
		if( ! self._options.calculateNumberOfProducts || self._isInit ) {			
			return;
		}
		
		self._ajaxGetInfo(['categories:tree','categories:cat_checkbox','price']);
		
		self._parseInfo('{"stock_status":[],"manufacturers":[],"rating":[],"attributes":[],"options":[],"filters":[],"discounts":[]}',true);
	},
	
	_setSeoData: function( data ) {
		var self = this;
		
		if( typeof data == 'undefined' ) {
			if( typeof MegaFilterCommonData.seo_data == 'undefined' ) {
				return;
			}
			
			data = MegaFilterCommonData.seo_data;
			delete MegaFilterCommonData.seo_data;
		} else if( typeof MegaFilterCommonData.seo_data == 'undefined' ) {
			MegaFilterCommonData.seo_data = {
				'h1' : $(self._options.contentSelectorH1).first().html(),
				'meta_title' : $('title').html(),
				'meta_description' : $('meta[name=description]').attr('content'),
				'meta_keywords' : $('meta[name=keywords]').attr('content')
			};
		}
		
		if( data.h1 ) {
			$(self._options.contentSelectorH1).first().html( data.h1 );
		}
		
		if( data.meta_title ) {
			$('title').html( data.meta_title );
		}
		
		if( data.meta_description ) {
			$('meta[name=description]').attr( 'content', data.meta_description );
		}
		
		if( data.meta_keyword ) {
			$('meta[name=keywords]').attr( 'content', data.meta_keyword );
		}
	},
	
	_parseInfo: function( data, first ) {
		var self	= this,
			filters	= self.filters(),
			json	= jQuery.parseJSON( data );
		
		self._setSeoData( json.seo_data );
		
		for( var i in json ) {
			switch( i ) {
				case 'categories:tree' : {
					self._box.find('.mfilter-category-tree > ul > li').remove();
					
					for( var j = 0; j < json[i].length; j++ ) {
						if( self._options.hideInactiveValues && json[i][j].cnt == '0' ) continue;
						
						self._box.find('.mfilter-category-tree > ul').append(jQuery('<li class="mfilter-tb-as-tr">')
							.append(jQuery('<div class="mfilter-tb-as-td">')
								.append(jQuery('<a>')
									.addClass(json[i][j].link?'mfp-value-link':'')
									.attr('href', json[i][j].link||'#')
									.attr('data-href', json[i][j].link||'#')
									.attr('data-id', json[i][j].id)
									.attr('data-parent-id', json[i][j].pid)
									.html( json[i][j].name )
								)
							)
							.append('<div class="mfilter-tb-as-td mfilter-col-count"><span class="mfilter-counter">' + json[i][j].cnt + '</span></div>')
						);
					}
					
					self._initTreeCategory( true );
					
					break;
				}
				case 'categories:cat_checkbox' : {
					var cnt = {};
					
					for( var j in json[i] ) {
						cnt[json[i][j].id] = json[i][j].cnt;
					}
					
					self._box.find('.mfilter-filter-item.mfilter-cat_checkbox').each(function(){
						var $self = jQuery(this),
							cx = 0,
							idx = 0;
						
						$self.find('input[value]').each(function(i){
							var $self2 = $(this),
								$parent = $self2.parent().parent(),
								$cnt = $parent.find('.mfilter-counter'),
								checked = $self2.is(':checked'),
								id = $self2.val(),
								c = typeof cnt[id] == 'undefined' ? 0 : parseInt( cnt[id] ),
								ct = c;
							
							if( typeof filters['path'] != 'undefined' ) {
								if( filters['path'].indexOf( encodeURIComponent( id ) ) == -1 ) {
									ct = '+' + ct;
								}
							}
								
							$cnt.text( ct )[checked?'addClass':'removeClass']('mfilter-close');
							
							if( c ) {
								cx++;
								$parent.removeClass('mfilter-hide mfilter-first-child');
							}
							
							if( checked || c ) {
								$self2.removeAttr('disabled');
								$parent.removeClass('mfilter-disabled');
								$parent.find('a.mfp-value-link').removeClass('mfp-value-link-disabled');
							} else {
								$self2.attr('disabled',true);
								$parent.addClass('mfilter-disabled');
								$parent.find('a.mfp-value-link').addClass('mfp-value-link-disabled');
							}
							
							if( ! $parent.hasClass('mfilter-hide') ) {
								if( i > 0 && idx == 0 ) {
									$parent.addClass('mfilter-first-child');
								}
								idx++;
							}
						});
						
						if( cx ) {
							$self.removeClass('mfilter-hide');
						}
					});
					
					break;
				}
				case 'price' : {
					var priceRange = self.getPriceRange();
					
					if( priceRange.min == self._options.priceMin && priceRange.max == self._options.priceMax ) {
						self._box.find('[id="mfilter-opts-price-min"]').val( json[i].min );
						self._box.find('[id="mfilter-opts-price-max"]').val( json[i].max );
					}
					
					self._options.priceMin = json[i].min;
					self._options.priceMax = json[i].max;
					
					self._refreshPrice();
					
					break;
				}
				case 'vehicles' : {
					self._box.find('.mfilter-filter-item.mfilter-vehicles').each(function(){
						var $li = jQuery(this),
							$prev = null,
							auto_levels = $li.attr('data-auto-levels') == '1' ? true : false,
							params = self._parseUrl( document.location.href.toString(), {'x':'x'} );
							/*filters = {};
				
							if( self._options.refreshResults == 'using_button' ) {
								filters = self.filters();
							} else if( typeof params[self._options.seo.parameter] != 'undefined' ) {
								filters = self.__urlToFilters( decodeURIComponent( params[self._options.seo.parameter] ) );
							}*/
							
							params	= typeof filters.vehicle != 'undefined' ? filters.vehicle.length : 0;
						
						$li.find('.mfilter-vehicles > .form-control').removeClass('mfilter-hide');
						
						$li.find('select').each(function(i){
							var keys	= [ 'makes', 'models', 'engines', 'years' ],
								vals	= typeof json['vehicles'][keys[i]] != 'undefined' ? json['vehicles'][keys[i]] : [],
								$self	= jQuery(this),
								val		= '';//typeof self.urlToFilters().vehicle != 'undefined' ? self.urlToFilters().vehicle[i] : '';

							if( typeof filters.vehicle != 'undefined' ) {
								val = filters.vehicle[i];
							}
							
							if( ( ( $prev == null || ! $prev.is(':disabled') ) && ( vals.length || params < i ) ) || ( keys[i] == 'years' && typeof json.vehicles.years != 'undefined' && json.vehicles.years.length ) ) {
								$self.html( '<option value="">' + $self.find('option:first').text() + '</option>' );
								
								for( var j = 0; j < vals.length; j++ ) {
									$self.append(jQuery('<option>')
										.attr({
											'value' : vals[j].value,
											'id' : vals[j].key,
											'data-name' : vals[j].name,
											'data-total' : vals[j].total?vals[j].total:''
										})
										.attr(keys[i]=='makes'?{
											'data-image' : vals[j].image
										}:{})
										.text(vals[j].name)
										.attr('selected', val == vals[j].value)
									);
								}

								$self.attr('disabled',vals.length?false:true).mf_selectpicker('refresh');
							} else {
								$self.attr('disabled',true).mf_selectpicker('refresh');
							}
							
							if( auto_levels || ( keys[i] == 'engines' && params >= 2 && ! vals.length ) ) {
								$self.parent()[i>0&&$self.is(':disabled')?'addClass':'removeClass']('mfilter-hide');
							}

							$prev = $self;
						});
					});
					
					break;
				}
				case 'levels' : {					
					self._box.find('.mfilter-filter-item.mfilter-levels').each(function(){
						var $li = jQuery(this),
							labels = $li.attr('data-labels').split('||');
						
						for( var i = 0; i < json['levels'].length; i++ ) {
							var $select = $li.find('select:eq(' + i + ')'),
								vals = json['levels'][i],
								val = '',
								tmp = {};
								
							if( typeof filters.level != 'undefined' ) {
								val = filters.level[i];
							}
							
							if( ! $select.length ) {
								$select = $('<select class="form-control" data-type="level-' + i + '">')
									.appendTo( $li.find('div.mfilter-levels') );
								
								$select.mf_selectpicker();
							}
							
							$select.html( '<option value="">' + ( typeof labels[i] == 'undefined' || labels[i] == '' ? ( vals.length && vals[0].label !== '' ? vals[0].label : '---' ) : labels[i] ) + '</option>' );
							
							for( var j = 0; j < vals.length; j++ ) {
								if( typeof tmp[vals[j].key] != 'undefined' ) continue;
								tmp[vals[j].key] = 1;
								
								$select.append(jQuery('<option>')
									.attr({
										'value' : vals[j].value,
										'id' : vals[j].key,
										'data-name' : vals[j].name,
										'data-total' : vals[j].total?vals[j].total:'',
										'data-image' : vals[j].image,
										'selected' : val == vals[j].value 
									})
									.text( vals[j].name )
								);
							}
							
							if( vals.length ) {
								$select.removeAttr('disabled');
							} else {
								$select.attr('disabled', true);
							}
							
							$select.mf_selectpicker('refresh');
						}
						
						if( $li.find('select').length >= json['levels'].length ) {
							$li.find('select').each(function(i){
								if( i >= json['levels'].length ) {
									jQuery(this).parent().remove();
								}
							});
						}
						
						if( $li.find('select').length ) {
							self._initEvents();
							$li.removeClass('mfilter-hide');
						} else {
							$li.addClass('mfilter-hide');
						}
					});
					
					break;
				}
				case 'tags' :
				case 'model' :
				case 'sku' :
				case 'upc' :
				case 'ean' :
				case 'jan' :
				case 'isbn' :
				case 'mpn' :
				case 'location' :
				case 'length' :
				case 'width' :
				case 'height' :
				case 'weight' :
				case 'rating' :
				case 'attributes' :
				case 'filters' :
				case 'options' :
				case 'discounts' :
				case 'manufacturers' :
				case 'stock_status' : {				
					self._box.find('.mfilter-filter-item.mfilter-' + i).each(function(){
						var $item		= jQuery(this),
							seo			= $item.attr('data-seo-name'),
							id			= $item.attr('data-id'),
							$items		= $item.find( '.mfilter-options .mfilter-option'),
							hidden		= 0;
						
						$items.each(function(){
							var $self		= jQuery(this),
								$input		= $self.find('input[type=checkbox],input[type=radio],select'),
								val			= $input.val(),
								$counter	= jQuery(this).find('.mfilter-counter'),
								text		= '',
								cnt			= json[i];							
							
							if( id && typeof cnt[id] != 'undefined' ) {
								cnt = cnt[id];
							}
							
							if( $self.hasClass( 'mfilter-select' ) ) {
								var $options	= $input.find('option'),
									hOptions	= 0,
									val			= $input.val(),
									idx			= $input.prop('selectedIndex');
								
								if( typeof self._selectOptions[seo] == 'undefined' ) {
									self._selectOptions[seo] = [];
									
									$options.each(function(){
										self._selectOptions[seo].push({
											'name'	: jQuery(this).attr('data-name'),
											'id'	: jQuery(this).attr('id'),
											'value'	: jQuery(this).attr('value'),
											'text'	: jQuery(this).html()
										});
									});
								}
								
								$options.remove();
								
								(function(){
									function add( $option ) {
										$input.append( $option );
										
										if( val == $option.val() ) {
											idx = $input.find('option').length-1;
										}
									}
									
									for( var i = 0; i < self._selectOptions[seo].length; i++ ) {
										var $option = jQuery('<option>')
											.attr('value', self._selectOptions[seo][i].value);

										if( self._selectOptions[seo][i].name ) {
											$option.attr('data-name', self._selectOptions[seo][i].name);
										}

										if( self._selectOptions[seo][i].id ) {
											$option.attr('id', self._selectOptions[seo][i].id);
										}

										if( self._selectOptions[seo][i].id ) {
											var idd = self._selectOptions[seo][i].id.split('-').pop();

											if( first || typeof cnt[idd] != 'undefined' ) {
												$option.html( ( ! first && self._options.showNumberOfProducts ? '(' + cnt[idd] + ') ' : '' ) + self._selectOptions[seo][i].name );
												
												add( $option );
											} else {
												$option.attr('disabled', true).html( ( self._options.showNumberOfProducts ? '(0)' : '' ) + self._selectOptions[seo][i].name );

												if( ! self._options.hideInactiveValues ) {
													add( $option );
												}

												hOptions++;
											}
										} else {
											$option.html( self._selectOptions[seo][i].text );
											add( $option );
										}
									}
								})();
								
								if( idx >= 0 ) {
									$input.prop('selectedIndex', idx);
								}
								
								if( hOptions == self._selectOptions[seo].length ) {
									hidden++;
								}
							} else if( $self.hasClass( 'mfilter-slider' ) ) {
								//if( self._options.hideInactiveValues ) {
									self._box.find('[data-id="' + id + '"][data-slider-id]').each(function(){
										var slider_id = jQuery(this).attr('data-slider-id'),
											data = {};

										for( var i in self._sliders[slider_id].data ) {
											if( typeof cnt != 'undefined' && typeof cnt[i] != 'undefined' && parseInt( cnt[i] ) > 0 ) {
												data[i] = self._sliders[slider_id].data[i];
											}
										}
										
										self._sliders[slider_id].init( data, true );
									});
								//}
							} else if( $self.hasClass( 'mfilter-text' ) ) {
								$input = $self.find('input[type=text]');
								
								if( typeof filters[seo] != 'undefined' ) {
									
								} else {
									
								}
							} else {
								var idd = $input.attr('id').split('-').pop();
								
								if( typeof filters[seo] != 'undefined' ) {
									if( filters[seo].indexOf( encodeURIComponent( self.encode( val ) ) ) > -1 ) {
										$counter.addClass( 'mfilter-close' );
									} else {
										if( ! $item.hasClass( 'mfilter-radio' ) && ! $item.hasClass('mfilter-image_list_radio') /*&& base_type != 'option'*/ )
											text += '+';

										$counter.removeClass( 'mfilter-close' );
									}
								} else {
									$counter.removeClass( 'mfilter-close' );
								}
								
								$self.removeClass('mfilter-first-child mfilter-last-child mfilter-disabled mfilter-hide mfilter-visible');
								$self.find('a.mfp-value-link').removeClass('mfp-value-link-disabled');
								$self.parent().removeClass('mfilter-hide');
								
								if( typeof cnt[idd] != 'undefined' && parseInt( cnt[idd] ) > 0 ) {
									text += cnt[idd];

									$self.addClass('mfilter-visible');
									$input.attr('disabled', false);
								} else {
									text = '0';
									hidden++;
									
									$self.addClass('mfilter-disabled');
									$self.find('a.mfp-value-link').addClass('mfp-value-link-disabled');
									$input.attr('disabled',true);
									
									if( i == 'stock_status' && ! first ) {
										$input.prop('checked',false);
										$input.parent().parent().find('.mfilter-close').removeClass('mfilter-close');
									}
										
									if( first !== true && self._options.hideInactiveValues && ! $input.is(':checked') ) {
										$self.addClass('mfilter-hide');
										
										if( self._box.hasClass('mfilter-content_top') ) {
											$self.parent().addClass('mfilter-hide');
										}
									}
								}

								$counter.text( text );
							}
						});
						
						if( first !== true && self._options.hideInactiveValues ) {
							if( $item.hasClass('mfilter-select') ) {
								$item[$item.find('select option[value!=""]').length?'removeClass':'addClass']('mfilter-hide');
							} else {
								$item[hidden==$items.length?'addClass':'removeClass']('mfilter-hide');
								$item.find('.mfilter-option').not('.mfilter-hide,.mfilter-hide-by-live-filter').first().addClass('mfilter-first-child');
								$item.find('.mfilter-option').not('.mfilter-hide,.mfilter-hide-by-live-filter').last().addClass('mfilter-last-child');
							}
						}
					});
					
					break;
				}
			}
		}
		
		if( self._options.hideInactiveValues ) {
			self._box.find('li.mfilter-gheader').each(function(){
				var $this = jQuery(this),
					key = $this.attr('data-group-key');
				
				if( self._box.find('li[data-group-key="' + key + '"]:not(.mfilter-gheader)').length == self._box.find('li[data-group-key="' + key + '"]:not(.mfilter-gheader).mfilter-hide').length ) {
					$this.addClass('mfilter-hide');
				} else {
					$this.removeClass('mfilter-hide');
				}
			});
		}
						
		if( first !== true && ( self._options.hideInactiveValues || self._box.find('[data-display-live-filter!="0"]').length ) ) {							
			for( var s = 0; s < self._scrolls.length; s++ ) {
				if( typeof self._scrolls[s] != 'undefined' ) {
					self._scrolls[s].refresh();
				}
			}

			for( var b = 0; b < self._buttonsMore.length; b++ ) {
				self._buttonsMore[b].refresh();
			}
			
			for( var f = 0; f < self._liveFilters.length; f++ ) {
				self._liveFilters[f].refresh();
			}

			if( self._relativeScroll != null ) {
				self._relativeScroll.refresh();
			}
		}
		
		self._updateInlineHorizontal();
	},
	
	_initAlwaysSearch: function() {
		var self	= this;
			
		function search() {
			self._jqContent.find('[name^=filter_],[name=search],[name=category_id],[name=sub_category],[name=description]').each(function(){
				var name	= jQuery(this).attr('name'),
					value	= jQuery(this).val(),
					type	= jQuery(this).attr('type');

				if( [ 'checkbox', 'radio' ].indexOf( type ) > -1 && ! jQuery(this).is(':checked') )
					value = '';
					
				if( name ) {
					self._inUrl[name] = value;
					self._params[name] = value;
				}
			});
			
			self.reload();
			//self.ajax();
		}
			
		jQuery('#button-search').unbind('click').click(function(e){
			e.preventDefault();
				
			search();
		});
			
		self._jqContent.find('input[name=filter_name],input[name=search]').unbind('keydown').unbind('keyup').bind('keydown', function(e){
			if( e.keyCode == 13 ) {
				e.preventDefault();
					
				search();
			}
		});
	},
	
	hexToRgb: function(str) {
		if ( /^#([0-9a-f]{3}|[0-9a-f]{6})$/ig.test(str) ) { 
			var hex = str.substr(1);
			hex = hex.length == 3 ? hex.replace(/(.)/g, '$1$1') : hex;
			var rgb = parseInt(hex, 16);               
			return [(rgb >> 16) & 255, (rgb >> 8) & 255, rgb & 255].join(',');
		} 
		
		return '255,255,255';
	},
	
	_initAlwaysAjaxPagination: function(){
		var self = this;
		
		if( ! self._options.ajaxPagination ) return;
		
		self._jqContent.find('.pagination a').click(function(){
			var url = jQuery(this).attr('href'),
				params = self._parseUrl( url );
			
			if( typeof params.page != 'undefined' ) {
				self._ajaxPagination = params.page;
				
				self.ajax( url );
				
				return false;
			}
		});
	},
		
	__initLoader: function() {
		var color = this.hexToRgb(typeof this._options.color == 'undefined' ? '#ffffff' : this._options.color.loader_over_results);
		
		this._jqLoader = jQuery('<span class="mfilter-ajax-loader-container" style="cursor: wait; z-index: 100; margin: 0; padding: 0; position: absolute; text-align: center; background-color: rgba(' + color + ',0.7);"></span>')
			.prependTo( this._jqContent )
			.html( '<img src="catalog/view/theme/default/stylesheet/mf/images/ajax-loader.gif?v2" alt="" />' )
			.hide();
	},
	
	__initLoaderFilter: function() {
		var color = this.hexToRgb(typeof this._options.color == 'undefined' ? '#ffffff' : this._options.color.loader_over_filter);
		
		this._jqLoaderFilter = jQuery('<span style="cursor: wait; z-index: 10000; margin: 0; padding: 0; position: absolute; background-color: rgba(' + color + ',0.7);"></span>')
			.prependTo( this._box )
			.hide();
	},
	
	/**
	 * Init displaying the list
	 */
	_initDisplayItems: function() {
		var self = this,
			isContentTop = self._box.hasClass( 'mfilter-content_top' ),
			params = self.urlToFilters();
		
		self._box.find('.mfilter-filter-item').each(function(i){
			var _level0				= jQuery(this),
				type				= _level0.attr('data-type'),
				seo_name			= _level0.attr('data-seo-name'),
				displayLiveFilter	= parseInt( _level0.attr('data-display-live-filter') ),
				displayListOfItems	= _level0.attr('data-display-list-of-items');
					
			if( ! displayListOfItems ) {
				displayListOfItems = self._options.displayListOfItems.type;
			}

			if( type == 'price' || type == 'rating' ) return;
			
			var wrapper = _level0.find('.mfilter-content-wrapper'),
				content	= _level0.find('> .mfilter-content-opts'),
				heading	= _level0.find('> .mfilter-heading'),
				idx = null;

			if( ! isContentTop && heading.hasClass( 'mfilter-collapsed' ) ) {
				if( typeof params[seo_name] == 'undefined' ) {
					content.show();
				}
			}
			
			if( displayListOfItems == 'scroll' ) {
				if( type == 'tree' || ( wrapper.actual ? wrapper.actual( 'outerHeight', { includeMargin: true } ) : wrapper.outerHeight(true) ) > self._options.displayListOfItems.maxHeight-1 ) {
					if( self._options.displayListOfItems.standardScroll || ( jQuery.browser && jQuery.browser.msie && jQuery.browser.version < 9 ) || ( /*/firefox/i.test(navigator.userAgent) &&*/ /mac/i.test(navigator.platform) ) ) {
						wrapper
							.addClass('mfilter-scroll-standard')
							.css({
								'max-height': self._options.displayListOfItems.maxHeight + 'px',
								'overflow-y': 'scroll'
							});
					} else {
						wrapper
							.attr('id', 'mfilter-content-opts-' + self._instanceIdx + '-' + i);

						(function(){
							if( type == 'slider' || type == 'text' || type == 'select' || type == 'vehicles' || type == 'levels' || type == 'price' ) return;
							
							var init = false,
								$self = jQuery( '#mfilter-content-opts-' + self._instanceIdx + '-' + i );
							
							idx = self._scrolls.length;
							
							self._scrolls.push({
								refresh: function(){
									if( init ) return;
									
									init = true;
									
									$self.removeClass('scroll-wrapper').css('max-height', self._options.displayListOfItems.maxHeight+'px').scrollbar();
								}
							});
							
							if( ! self._options.calculateNumberOfProducts && typeof self._scrolls[idx] != 'undefined' ) {
								self._scrolls[idx].refresh();
							}
						})();
					}
				}
			} else if( displayListOfItems == 'button_more' && ! isContentTop && type != 'image' && type != 'image_radio' ) {
				self._buttonsMore.push((function( _level0 ){		
					function init( first ) {
						var lessHeight	= 0,
							$cnt 		= _level0.find('.mfilter-options-container');
						
						if( ! $cnt.length ) {
							$cnt = _level0.find('.mfilter-content-wrapper');
						}
						
						var
							moreHeight	= $cnt.actual ? $cnt.actual( 'outerHeight', { includeMargin: true } ) : $cnt.outerHeight(true),
							show		= false,
							count		= 0,
							idx			= 0;
						
						_level0.find('.mfilter-option.mfilter-tb-as-tr').each(function(i){
							var _this = jQuery(this);
							
							if( _this.hasClass('mfilter-hide') || _this.hasClass('mfilter-hide-by-live-filter') ) return;

							if( idx < self._options.displayListOfItems.limit_of_items ) {
								lessHeight += _this.actual ? _this.actual( 'outerHeight', { includeMargin: true } ) : _this.outerHeight(true);
							} else {
								count++;
							}
							
							idx++;
						});

						if( count ) {
							wrapper.css('overflow','hidden').css('height', lessHeight+'px');
							
							function sh( show, force ) {
								if( force ) {
									wrapper.height( moreHeight );
								} else {
									wrapper.animate({
										'height' : ! show ? moreHeight : lessHeight
									}, 500, function(){
										if( self._relativeScroll != null )
											self._relativeScroll.refresh();
									});
								}
										
								_level0.find('a.mfilter-button-more').text(show?self._options.displayListOfItems.textMore.replace( '%s', count ):self._options.displayListOfItems.textLess);
							}

							_level0.find('.mfilter-content-opts').append(jQuery('<div>')
								.addClass( 'mfilter-button-more' )
								.append(jQuery('<a>')
									.attr( 'href', '#' )
									.addClass( 'mfilter-button-more' )
									.text( self._options.displayListOfItems.textMore.replace( '%s', count ) )
									.bind('click', function(){
										sh( show );

										show = ! show;
										
										wrapper[show?'addClass':'removeClass']('mfilter-slide-down');

										return false;
									})
								)
							);
						
							if( wrapper.hasClass('mfilter-slide-down') ) {
								sh( false, true );
								show = true;
							}
						}
					}
					
					init( true );
					
					idx = self._buttonsMore.length;
					
					return {
						refresh: function() {
							_level0.find('.mfilter-content-wrapper').removeAttr('style');
							_level0.find('.mfilter-button-more').remove();
							
							init();
						}
					};
				})( _level0 ));
			}
			
			if( type == 'cat_checkbox' ) {
				(function(){
					var cnt = 0;
					
					content.find('.mfilter-category .mfilter-option').each(function(i){
						if( jQuery(this).find('.mfilter-counter').text() != '0' ) {							
							if( i && ! cnt ) {
								jQuery(this).addClass('mfilter-first-child');
							}
							
							cnt++;
						} else {
							jQuery(this).addClass('mfilter-hide');
						}
					});
					
					if( ! cnt ) {
						_level0.addClass('mfilter-hide');
					}
				})();
			}
			
			(function(){
				if( isContentTop ) {
					return;
				}
				
				if( displayLiveFilter < 1 || content.find('.mfilter-option').length < displayLiveFilter || type == 'image' || type == 'image_radio' ) {
					displayLiveFilter = 0;
					
					return;
				}
				
				content.prepend('<div class="mfilter-live-filter"><input type="text" class="form-control" id="mfilter-live-filter-input-' + self._instanceIdx + '-' + i + '" /></div>');
				
				wrapper.find('> .mfilter-options > div').attr('id', 'mfilter-live-filter-list-' + self._instanceIdx + '-' + i);

				_level0.addClass('mfilter-live-filter-init');

				jQuery('#mfilter-live-filter-list-' + self._instanceIdx + '-' + i).liveFilter('#mfilter-live-filter-input-'+self._instanceIdx + '-' + i, '.mfilter-visible,.mfilter-should-visible,.mfilter-disabled,.mfilter-option:not(.mfilter-filter-item)', {
					'filterChildSelector' : 'label',
					'after' : function(contains, containsNot){
						var list = jQuery('#mfilter-live-filter-list-' + self._instanceIdx + '-' + i);

						contains.removeClass('mfilter-should-visible').addClass('mfilter-visible');
						containsNot.removeClass('mfilter-visible').addClass('mfilter-should-visible');

						list.find('> .mfilter-option').removeClass('mfilter-first-child mfilter-last-child');
						
						list.find('> .mfilter-option:not(.mfilter-hide):not(.mfilter-hide-by-live-filter):first').addClass('mfilter-first-child');
						list.find('> .mfilter-option:not(.mfilter-hide):not(.mfilter-hide-by-live-filter):last').addClass('mfilter-last-child');

						if( idx !== null ) {
							if( displayListOfItems == 'scroll' ) {
								if( typeof self._scrolls[idx] != 'undefined' ) {
									self._scrolls[idx].refresh();
								}
							} else if( displayListOfItems == 'button_more' ) {
								self._buttonsMore[idx].refresh();
							}
						}
						
						if( self._relativeScroll != null ) {
							self._relativeScroll.refresh();
						}
					}
				});
					
				_level0.addClass('mfilter-live-filter-init');
				
				self._liveFilters.push({
					refresh: function(){
						content.find('.mfilter-live-filter')[content.find('.mfilter-option:not(.mfilter-hide)').length <= displayLiveFilter?'hide':'show']();
					},
					check: function() {
						jQuery('#mfilter-live-filter-input-'+self._instanceIdx + '-' + i).trigger('keyup');
					}
				});
				
				self._liveFilters[self._liveFilters.length-1].refresh();
			})();

			if( ! isContentTop && heading.hasClass( 'mfilter-collapsed' ) ) {
				if( typeof params[seo_name] == 'undefined' ) {
					content.hide();
				}
			}
		});
	},
			
	/**
	 * Init headers
	 */
	_initHeading: function() {
		var self = this;
		
		if( self._box.hasClass('mfilter-content_top') )
			return;
		
		self._box.find('.mfilter-heading').click(function(){
			var opts = jQuery(this).parent().find('> .mfilter-content-opts');

			if( jQuery(this).hasClass('mfilter-collapsed') ) {
				opts.slideDown('normal', function(){
					if( self._relativeScroll != null )
						self._relativeScroll.refresh();
				});
				jQuery(this).removeClass('mfilter-collapsed');
			} else {
				opts.slideUp('normal', function(){
					if( self._relativeScroll != null )
						self._relativeScroll.refresh();
				});
				jQuery(this).addClass('mfilter-collapsed');
			}
		});
	},
	
	_updateInlineHorizontal: function() {
		for( var i = 0; i < this._inlineHorizontalUpdate.length; i++ ) {
			this._inlineHorizontalUpdate[i]();
		}
	},
	
	_initInlineHorizontal: function() {
		var self = this;
		
		if( ! self._box.hasClass( 'mfilter-content_top' ) ) {
			return;
		}
		
		self._box.find('li[data-inline-horizontal="1"][data-type="checkbox"],li[data-inline-horizontal="1"][data-type="radio"],li[data-inline-horizontal="1"][data-type="image_list_checkbox"],li[data-inline-horizontal="1"][data-type="image_list_radio"],li[data-inline-horizontal="1"][data-type="image_radio"],li[data-inline-horizontal="1"][data-type="image_checkbox"]').each(function(){
			var $this = jQuery(this),
				$container = $this.addClass('mfilter-inline-horizontal').find('.mfilter-opts-container'),
				$wrapper = $container.find('> .mfilter-content-wrapper'),
				$options = $wrapper.find('> .mfilter-options'),
				$optionsCnt = $options.find('> .mfilter-options-container'),
				type = $this.attr('data-type'),
				selector = type == 'image_radio' || type == 'image_checkbox' ? 'li.mfilter-option' : '> .mfilter-tb',
				$tb = $optionsCnt.find('> .mfilter-tb'),
				left = 0;
			
			function width() {
				var w = 0,
					b = false;
				
				left = 0;
				
				$tb.find(selector).each(function(){
					var ww = jQuery(this).outerWidth(true);
					
					if( self._lastEvent ) {
						var $el = jQuery(this).find('[id="' + self._lastEvent + '"]');
						
						if( $el.length ) {
							b = true;
						} else if( ! b ) {
							left += ww;
						}
					}
					
					w += ww;
				});
				
				return w;
			}
			
			self._inlineHorizontalUpdate[self._inlineHorizontalUpdate.length] = function() {
				$optionsCnt.removeAttr('style');
				$tb.removeAttr('style').css('margin-left',$tb.attr('data-mgr')+'px');
				
				o1 = w1;
				o2 = w2;
				
				w1 = $optionsCnt.width()-2*8;
				w2 = width();
				
				$optionsCnt.css('width', w1);
				$tb.css('width', w2+fix);
				
				if( w2 > w1 ) {
					$right.addClass('mf-active');
					
					if( x >= w2-w1 && $left.hasClass('mf-active') ) {
						t=0;
						$right.trigger('click');
					} else if( self._lastEvent ) {
						var $el = $tb.find('[id="' + self._lastEvent + '"]');
						
						if( $el.length ) {
							var w = $el.parent().parent().parent().outerWidth(true);
							
							if( x > left ) {
								t=0;
								x=left-w+w1;
								$left.trigger('click');
							} else if( x+w1 < left+w ) {
								t=0;
								x=x+(w*2)-w1;
								$right.trigger('click');
							}
						}
					}
				} else {
					t=x=0;
					$left.addClass('mf-active').trigger('click');
					$right.removeClass('mf-active');
				}
				
				/*if( ! $right.hasClass('mf-active') ) {
					if( w2 > w1 ) {
						//t=0;
						$right.addClass('mf-active');//.trigger('click');
					} else {
						t=x=0;
						$left.addClass('mf-active').trigger('click');
						//$right.removeClass('mf-active');
					}
				} else {
					if( w2 <= w1 ) {
						$right.removeClass('mf-active');
					}
				}*/
			};
			
			var $left = jQuery('<a href="#"></a>'),
				$right = jQuery('<a href="#"></a>');
			
			$wrapper.prepend(jQuery('<div class="mfilter-scroll-left"></div>').append($left));
			$wrapper.append(jQuery('<div class="mfilter-scroll-right"></div>').append($right));
			
			var w1 = $optionsCnt.width(),
				w2 = width(),
				o1 = -1,
				o2 = -1,
				x = 0,
				fix = 50,
				t = 'normal';
			
			if( w2 > w1 ) {
				$right.addClass('mf-active');
			}
			
			$optionsCnt.css('width', w1);
			$tb.css('width', w2+fix).attr('data-mgr','0');
			
			$left.click(function(){
				var $self = jQuery(this);
				
				if( ! $self.hasClass('mf-active') ) return false;
				
				x -= w1;
				
				if( x <= 0 ) {
					x = 0;
					$self.removeClass('mf-active');
				}
				
				$tb.attr('data-mgr', -x).stop().animate({
					'marginLeft' : -x
				}, t);
				
				t = 'normal';
				
				$right.addClass('mf-active');
				
				return false;
			});
			$right.click(function(){
				var $self = jQuery(this);
				
				if( ! $self.hasClass('mf-active') ) return false;
				
				x += w1;
				
				if( x >= w2-w1 ) {
					x = w2-w1;
					$self.removeClass('mf-active');
				}
				
				$tb.attr('data-mgr', -x).stop().animate({
					'marginLeft' : -x
				}, t);
				
				t = 'normal';
				
				$left.addClass('mf-active');
				
				return false;
			});
		});
	},
	
	_initCategoryRelated: function() {
		var self	= this;
		
		self._box.find('.mfilter-filter-item.mfilter-related').each(function(){
			var $li			= jQuery(this),
				seoName		= $li.attr('data-seo-name'),
				autoLevels	= $li.attr('data-auto-levels'),
				fields		= $li.find('select[data-type="category-related"]');
			
			fields.each(function(i){				
				if( ! autoLevels && i == fields.length - 1 ) {
					jQuery(this).change(function(){
						self.runAjaxIfPossible();
					});
				} else {
					function eChange( $self, id ) {
						var $this = $self.parent().attr('data-id', id),
							labels = $this.parent().attr('data-labels').split('#|#');
						
						$self.bind('change', function(e, auto){
							var cat_id = $self.val(),
								$next = $this.next().find('select'),
								$parent = $next.parent(),
								label = typeof labels[id+1] == 'undefined' ? $parent.attr('data-next-label') : labels[id+1];

							if( cat_id ) {
								$next.html('<option value="">' + self._options.text.loading + '</option>');
								$next.prop('selectedIndex', 0);

								jQuery.post( self._ajaxUrl( self._options.ajaxGetCategoryUrl ), { 'cat_id' : cat_id }, function( response ){
									var data = jQuery.parseJSON( response );

									if( data.length && autoLevels ) {
										var $li = jQuery('<li>');

										$this.after( $li );
										$next = jQuery('<select>').appendTo( $li );
										
										if( ! label )
											label = MegaFilterLang.text_select;

										eChange( $next, id+1 );
									}

									$next.html('<option value="">' + label + '</option>');
									$next.prop('selectedIndex', 0);

									for( var i = 0; i < data.length; i++ ) {
										$next.append( '<option value="' + data[i].id + '">' + data[i].name + '</option>' );
									}

									if( autoLevels ) {
										if( ! data.length && ! auto ) {
											self.runAjaxIfPossible();
										}
									} else if( ! data.length && ! auto ) {
										self.runAjaxIfPossible();
									}
								});
							} else if( $self.parent().attr('data-id') == '0' ) {
								fields.prop('selectedIndex', 0);
								self.runAjaxIfPossible();
							}

							var $p = $parent;

							while( $p.length ) {
								if( autoLevels ) {
									var $t = $p;
									$p = $p.next();
									$t.remove();
								} else {
									$p.find('select').prop('selectedIndex', 0).find('option[value!=""]').remove();
									$p = $p.next();
								}
							}
							
							if( ! cat_id ) {
								var beforeVal	= self.urlToFilters()[seoName],
									afterVal	= self.filters()[seoName];

								if( typeof beforeVal == 'undefined' )
									beforeVal = [-1];

								if( typeof afterVal == 'undefined' )
									afterVal = [-1];

								if( beforeVal.toString() != afterVal.toString() ) {
									self.runAjax();
								}
							}
						});
					}

					eChange( jQuery(this), i );
				}
			});
			
			if( ! self._isInit ) {
				setTimeout(function(){
					fields.filter(function(){
						return $(this).val();
					}).last().each(function(i){
						jQuery(this).trigger('change', true);
					});
				}, 100);
			}
		});
	},
	
	runAjaxIfPossible: function(){
		var self = this;
		
		if( self._options['refreshResults'] != 'using_button' ) {
			self.runAjax();
			
			return true;
		} else if( self._options['usingButtonWithCountInfo'] && self._options['calculateNumberOfProducts'] ) {
			self._ajaxGetInfo([], true, true);
			
			return true;
		}
		
		return false;
	},
	
	renderSelectedFilters: function( init ){
		if( ! this._options.displaySelectedFilters ) return;
		
		var self = this,
			filters = self.filters(),
			list = [],
			i, j;
		
		self.eachInstances(function( self ){
			filters = jQuery.extend(filters, self.filters());
		}, true);
		
		if( self._selectedFilters === null ) {
			self._selectedFilters = $('<div class="mfilter-selected-filters" data-idx="' + self._instanceIdx + '">').append('<div class="mfilter-selected-filters-cnt"></div>');
			
			if( self._jqContent.attr('class') ) {
				self._selectedFilters.addClass( self._jqContent.attr('class') );
			}
			
			if( self._options.displaySelectedFilters == 'over_filter' ) {
				self._box.find('> .mfilter-content:first').prepend( self._selectedFilters );
			} else {
				self._jqContent.before( self._selectedFilters );
			}
		}
		
		if( ! init ) {
			self.eachInstances(function( self ){
				self.renderSelectedFilters( true );
			}, true);
		}
		
		if( self._selectedFilters.attr('data-idx') != self._instanceIdx+'' ) return;
		
		function add( label, fn ) {
			list.push($('<a>').html('<span>'+label+'</span><span class="mfilter-close"><i></i></span>').click(function(){
				fn();
				
				return false;
			}));
		}
		
		for( i in filters ) {
			(function($li){
				var txt = jQuery.trim( $li.find('.mfilter-heading-text span').html() ),
					type = $li.attr('data-type'),
					baseType = $li.attr('data-base-type');

				if( txt !== '' ) {
					txt += ': ';
				}
				
				switch( true ) {
					case type == 'slider' : {
						(function( $inputs ){
							var $min = $inputs.find('.mfilter-opts-slider-min'),
								$max = $inputs.find('.mfilter-opts-slider-max');

							if( $min.attr('data-key') != $min.attr('data-min') || $max.attr('data-key') != $max.attr('data-max') ) {
								add(txt + $min.val() + ' - ' + $max.val(), function(){
									self._sliders[$li.attr('data-slider-id')].resetValues();

									if( ! self.runAjaxIfPossible() && self._options['refreshResults'] == 'using_button' ) {
										self.runAjax();
									}
								});
							}
						})( $li.find('.mfilter-slider-inputs') );

						break;
					}
					case type == 'price' : {
						(function( $inputs ){
							var $min = $inputs.find('#mfilter-opts-price-min'),
								$max = $inputs.find('#mfilter-opts-price-max');

							if( $min.val() != self._options.priceMin || $max.val() != self._options.priceMax ) {
								add(txt + $min.val() + ' - ' + $max.val(), function(){
									$min.val( self._options.priceMin );
									$max.val( self._options.priceMax );
									$li.find('[id="mfilter-price-slider"]').each(function(){					
										jQuery(this).slider( 'option', 'min', self._options.priceMin );
										jQuery(this).slider( 'option', 'max', self._options.priceMax );
										jQuery(this).slider( 'option', 'values', [ self._options.priceMin, self._options.priceMax ] );
										jQuery(this).slider( 'value', jQuery(this).slider('value') );
									});

									if( ! self.runAjaxIfPossible() && self._options['refreshResults'] == 'using_button' ) {
										self.runAjax();
									}
								});
							}
						})( $li.find('.mfilter-price-inputs') );

						break;
					}
					case type == 'search' :
					case type == 'text' : {
						(function( $input ){
							add(txt + $input.val(), function(){
								$input.val('').trigger('resetvalue');

								if( ! self.runAjaxIfPossible() && self._options['refreshResults'] == 'using_button' ) {
									self.runAjax();
								}
							});
						})( $li.find('input[type=text]') );

						break;
					}
					case type == 'levels' :
					case type == 'select' :
					case type == 'vehicles' : {
						$li.find('select').each(function(){
							var $this = $(this);

							if( $this.val() ) {
								$this.find('option:first').each(function(){
									if( $(this).text().replace(/-+/, '') !== '' ) {
										txt = $(this).text() + ': ';
									}
								});

								var $option = $this.find('option[value="' + $this.val() + '"]');

								add( $option.attr('data-name')?txt + $option.attr('data-name'):txt + $option.text(), function(){
									$this.prop('selectedIndex',0).trigger('change','skipRunAjax');
									
									if( ! self.runAjaxIfPossible() && self._options['refreshResults'] == 'using_button' ) {
										self.runAjax();
									}
								});
							}
						});

						break;
					}
					default : {						
						function findInput( val ) {
							var $input = $li.find('input[value="' + val.replace( /"/g, '&quot;' ) + '"]');							
						
							if( $input.length == 0 ) {
								$li.find('input').each(function(){
									if( $(this).val() == val ) {
										$input = $(this); return true;
									}
								});
							}
							
							return $input;
						}
						
						for( j = 0; j < filters[i].length; j++ ) {
							var val = self.decode( decodeURIComponent( filters[i][j] ) ),
								txt2 = txt;

							switch( true ) {
								case ( type == 'checkbox' || type == 'radio' || type == 'image_list_radio' || type == 'image_list_checkbox' || type == 'rating' || type == 'cat_checkbox' ) : {
									(function( $input ){
										if( ! $input.length ) return;
										
										if( $input.parent().next().find('.mfp-value-link').length ) {
											txt2 += $input.parent().next().find('.mfp-value-link').html();
										} else {
											txt2 += $input.parent().next().html();
										}
										
										add(txt2, function(){
											$input.prop('checked', false).trigger('change','skipRunAjax');
											
											if( ! self.runAjaxIfPossible() && self._options['refreshResults'] == 'using_button' ) {
												self.runAjax();
											}
										});
									})( findInput( val ) );

									break;
								}
								case ( type == 'image' || type == 'image_radio' ) && ( baseType == 'attribute' || baseType == 'option' || baseType == 'filter' ) : {
									(function( $input ){
										if( ! $input.length ) return;
										
										if( $input.next().find('img').length ) {
											txt2 += $input.next().find('img').parent().html();
										} else {
											txt2 += $input.next().attr('title');
										}
										
										add(txt2, function(){
											$input.prop('checked', false).trigger('change','skipRunAjax');
											
											if( ! self.runAjaxIfPossible() && self._options['refreshResults'] == 'using_button' ) {
												self.runAjax();
											}
										});
									})( findInput( val ) );

									break;
								}
							}
						}
					}
				}
			})( self._box.find('[data-seo-name="' + i + '"]') );
		}
		
		var $cnt = self._selectedFilters.find('> div').html('');
		
		self._selectedFilters[list.length?'show':'hide']();
		
		for( i = 0; i < list.length; i++ ) {
			$cnt.append( list[i] );
		}
	},
	
	_initSelectedFilters: function(){
		var self = this;
		
		setTimeout(function(){
			self.renderSelectedFilters( true );
		}, 100);
	},
	
	/**
	 * Init events
	 */
	_initEvents: function() {
		var self = this;
		
		function val( $input ) {
			var val = $input.val(),
				parent = $input.parent();
			
			if( $input.attr('type') == 'checkbox' || $input.attr('type') == 'radio' ) {
				parent.parent().find('.mfilter-counter').unbind('click').bind('click', function(){
					if( ! jQuery(this).hasClass( 'mfilter-close' ) ) return;
					
					$input.prop('checked', false).trigger('change');
				});
				
				val = $input.is(':checked');
				
				if( ! self._options.calculateNumberOfProducts ) {
					if( self._isInit ) {
						if( $input.attr('type') == 'radio' ) {
							parent.parent().parent().find('.mfilter-counter').removeClass('mfilter-close');
						} else if( $input.attr('type') == 'checkbox' ) {
							parent.parent().find('.mfilter-counter').removeClass('mfilter-close');
						}
					}
					
					parent.parent().find('.mfilter-counter')[val?'addClass':'removeClass']('mfilter-close');
				}
				
				if( $input.attr('type') == 'radio' ) {
					parent.parent().parent().parent().parent().parent().parent().find('.mfilter-option').removeClass('mfilter-input-active mfilter-image-checked');
				}
			}
			
			parent[val?'addClass':'removeClass']('mfilter-input-active');
						
			if( parent.hasClass( 'mfilter-image' ) ) {
				parent[val?'addClass':'removeClass']('mfilter-image-checked');
			}
		}
		
		self._box.find('input[type=checkbox],input[type=radio],select:not([data-type="category-related"])').unbind('change').change(function(e,t){
			var type = jQuery(this).attr('data-type');
			
			if( type && ( type.split('-')[0] == 'vehicle' || type.split('-')[0] == 'level' ) ) {
				var reset = false;
					
				jQuery(this).parent().parent().find('select').each(function(i){
					if( reset ) {
						jQuery(this).html( '<option value="">' + jQuery(this).find('option:first').text() + '</option>' ).prop('selectedIndex',0).mf_selectpicker('refresh');
					} else if( jQuery(this).attr('data-type') == type ) {
						reset = true;
					}
				});
			}
			
			self._lastEvent = jQuery(this).attr('id');
			
			if( t !== 'skipRunAjax' ) {
				self.runAjaxIfPossible();
			}
			
			val(jQuery(this));
			
			if( type && ( type.split('-')[0] == 'vehicle' || type.split('-')[0] == 'level' ) && type.split('-')[1] != 'years' && self._options['refreshResults'] == 'using_button' ) {
				self._ajaxGetInfo([], true);
			}
		});
		
		self._box.find('.mfilter-options .mfilter-option input[type=checkbox]:checked,.mfilter-options .mfilter-option input[type=radio]:checked').each(function(){
			val(jQuery(this));
		});
		
		self._box.find('.mfilter-button a').bind('click', function(){
			self._lastEvent = null;
			
			if( jQuery(this).hasClass( 'mfilter-button-reset' ) ) {
				self.eachInstances(function( self ){
					self.resetFilters( undefined, true );
				});
			}
			
			self.ajax();
			
			return false;
		});
	},
			
	/**
	 * Run ajax
	 */
	runAjax: function() {
		var self = this;
				
		switch( self._options['refreshResults'] ) {
			case 'using_button' :
			case 'immediately' : {
				self.ajax();
					
				break;
			}
			case 'with_delay' : {
				if( self._timeoutAjax )
					clearTimeout( self._timeoutAjax );
					
				self._timeoutAjax = setTimeout(function(){
					self.ajax( undefined, undefined );
							
					self._timeoutAjax = null;
				}, self._options['refreshDelay'] );
					
				break;
			}
		}
	},
	
	/**
	 * Get the current price range
	 */
	getPriceRange: function() {
		var self		= this,
			minInput	= self._box.find('[id="mfilter-opts-price-min"]'),
			maxInput	= self._box.find('[id="mfilter-opts-price-max"]'),
			min			= minInput.val(),
			max			= maxInput.val();		
			
		if( ! /^[0-9]+$/.test( min ) || min < self._options.priceMin )
			min = self._options.priceMin;
		
		if( ! /^[0-9]+$/.test( max ) || max > self._options.priceMax )
			max = self._options.priceMax;
		
		return {
			min : parseInt( min ),
			max : parseInt( max )
		};
	},
	
	/**
	 * Init price range
	 */
	_initPrice: function() {
		var self		= this,
			priceRange	= self.getPriceRange(),
			filters		= self.urlToFilters(),
			minInput	= self._box.find('[id="mfilter-opts-price-min"]').unbind('change').bind('change', function(){
				changePrice();
			}).val( filters.price ? filters.price[0] : priceRange.min ),
			maxInput	= self._box.find('[id="mfilter-opts-price-max"]').unbind('change').bind('change', function(){
				changePrice();
			}).val( filters.price ? filters.price[1] : priceRange.max ),
			slider		= self._box.find('[id="mfilter-price-slider"]');
		
		self._refreshPrice = function( minMax ) {
			var priceRange = self.getPriceRange();
			
			if( priceRange.min < self._options.priceMin ) {
				priceRange.min = self._options.priceMin;
			}
			
			if( priceRange.max > self._options.priceMax ) {
				priceRange.max = self._options.priceMax;
			}
			
			if( priceRange.min > priceRange.max ) {
				priceRange.min = priceRange.max;
			}
			
			if( priceRange.min.toString() != minInput.val() ) {
				minInput.val( priceRange.min );
			}
			
			if( priceRange.max.toString() != maxInput.val() ) {
				maxInput.val( priceRange.max );
			}
			
			slider.slider( 'option', 'values', [ priceRange.min, priceRange.max ] );
			
			if( minMax !== false ) {
				slider.slider( 'option', 'min', self._options.priceMin );
				slider.slider( 'option', 'max', self._options.priceMax );
				slider.slider( 'value', slider.slider('value') );
			}
		};
			
		function changePrice() {
			self._refreshPrice( false );
			
			self.runAjaxIfPossible();
		}
		
		slider.slider({
			range	: true,
			min		: self._options.priceMin,
			max		: self._options.priceMax,
			values	: [ priceRange.min, priceRange.max ],
			isRTL	: self._options.direction == 'rtl',
			slide	: function( e, ui ) {
				minInput.val( ui.values[0] );
				maxInput.val( ui.values[1] );
			},
			stop	: function( e, ui ) {
				self.runAjaxIfPossible();
			}
		});
	},
	
	_initWindowOnPopState: function(){
		var self = this,
			inited = false;
			
		if( self._isInit ) return;
		
		function update() {
			self.eachInstances(function( self ){
				self._urlToFilters = null;
				self.initUrls();
				self.setFiltersByUrl();
			});
		}

		function setFilters( url ) {
			var params = self._parseUrl( url );

			if( typeof params[self._options.seo.parameter] != 'undefined' ) {
				self.setFiltersByUrl( self.__urlToFilters( decodeURIComponent( params[self._options.seo.parameter] ) ) );
			} else {
				self.resetFilters();
			}
		}
		
		// delay due Safari
		jQuery().ready(function(){
			setTimeout(function(){
				inited = true;
			},1000);
		});

		window.onpopstate = function(e){
			if( ! inited ) return;
			
			if( e.state ) {
				update();

				self._render( e.state.html, e.state.json, true );

				setFilters( e.state.url );
				self.renderSelectedFilters();
			} else if( typeof MegaFilterCommonData.mainContent[self.location()] != 'undefined' && self._history > 0 ) {
				update();

				self._render( MegaFilterCommonData.mainContent[self.location()].html, MegaFilterCommonData.mainContent[self.location()].json, true );

				setFilters( self.location() );
				self.renderSelectedFilters();
			} else if( self._changed && self._history > 0 ) {
				setFilters( self._startUrl.toString() );

				self.ajax( null, true );
			} else {
				update();
				
				setFilters( self.location() );
				
				self.ajax( null, true );
			}

			self._history--;
		};
	},
	
	count: function( obj ) {
		var c = 0;
		
		for( var i in obj ) {
			c++;
		}
		
		return c;
	},
	
	_initVehicles: function() {
		var self = this;
		
		self._box.find('li[data-type="vehicles"]').each(function(){
			var $li = jQuery(this),
				auto_levels = $li.attr('data-auto-levels')=='1'?true:false;
			
			$li.find('select').each(function(i){
				var $self = jQuery(this);

				if( $self.find('option').length == 1 ) {
					$self.attr('disabled',true).mf_selectpicker('refresh');
					
					if( auto_levels && i > 0 ) {
						$self.parent().addClass('mfilter-hide');
					}
				}
			});
		});
	},
	
	_initLevels: function() {
		var self = this;
		
		self._box.find('li[data-type="levels"]').each(function(){
			var $li = jQuery(this);
			
			$li.find('select').each(function(i){
				var $self = jQuery(this);

				if( $self.find('option').length == 1 ) {
					$self.attr('disabled',true).mf_selectpicker('refresh');
					
					if( i > 0 ) {
						$self.parent().addClass('mfilter-hide');
					}
				}
			});
		});
	},
	
	setFiltersByUrl: function( params ) {
		var self	= this;
		
		console.log(params);
		
		if( typeof params == 'undefined' ) {
			params = self.urlToFilters();
		}
		
		self.resetFilters( false );
		
		self._box.find('li[data-type]').each(function(){
			var _this	= jQuery(this),
				type	= _this.attr('data-type'),
				seoName	= type == 'tree' || type == 'cat_checkbox' ? 'path' : _this.attr('data-seo-name'),
				value	= params[seoName];
			
			if( typeof value == 'undefined' || typeof value[0] == 'undefined' ) {
				return;
			}
			
			switch( type ) {
				case 'tree' : {
					_this.find('input[name=path]').val( value.join('_') );
					
					break;
				}
				case 'cat_checkbox' :
				case 'rating' :
				case 'stock_status' :
				case 'manufacturers' :
				case 'discounts' :
				case 'image' :
				case 'image_radio' :
				case 'radio' :
				case 'image_list_radio' :
				case 'image_list_checkbox' :
				case 'checkbox' : {
					for( var i in value ) {
						if( typeof value[i] == 'function' ) continue;
						
						if( type == 'image_radio' || type == 'radio' || type == 'image_list_radio' ) {
							_this.find('.mfilter-image-checked').removeClass('mfilter-image-checked');
						}
						
						var val;
						
						try {
							val = decodeURIComponent( value[i] );
						} catch( e ){
							val = value[i];
						}
						
						var val = self.decode( val ),
							$p1 = _this.find('input[value="' + val.replace( /"/g, '&quot;' ) + '"]');
							
						if( $p1.length == 0 ) {
							_this.find('input').each(function(){
								if( $(this).val() == val ) {
									$p1 = $(this); return true;
								}
							});
						}
						
						$p1 = $p1.prop('checked', true)
							.parent()
							.addClass('mfilter-input-active');
						
						$p1.parent()
							.find('.mfilter-counter').addClass('mfilter-close');
						
						if( $p1.hasClass( 'mfilter-image' ) ) {
							$p1.addClass('mfilter-image-checked');
						}
					}
					
					break;
				}
				case 'related' :
				case 'levels' :
				case 'vehicles' : {
					_this.find('select').each(function(i){
						if( typeof value[i] != 'undefined' ) {
							jQuery(this).find('option').each(function(j){
								if( value[i] == jQuery(this).val() ) {
									var $s = jQuery(this).parent().prop('selectedIndex',j);
									
									if( type != 'related' ) {
										$s.mf_selectpicker('refresh');
									}
									
									return false;
								}
							});
						}
					});
					
					break;
				}
				case 'select' : {
					(function( val ){
						_this.find('select option').each(function(i){
							if( $(this).val() == val ) {
								$(this).parent().prop('selectedIndex', i);

								return false;
							}
						});
					})( self.decode( decodeURIComponent( value[0] ) ) );
					
					//[value="' + self.decode( decodeURIComponent( value[0] ) ).replace( /"/g, '&quot;' ) + '"]').attr('selected', true);
					
					_this.find('select.mf_selectpicker').mf_selectpicker('refresh');
						
					break;
				}
				case 'price' : {
					if( typeof value[0] != 'undefined' && typeof value[1] != 'undefined' ) {
						_this.find('input[id="mfilter-opts-price-min"]').val( value[0] );
						_this.find('input[id="mfilter-opts-price-max"]').val( value[1] );

						_this.find('[id="mfilter-price-slider"]').each(function(){					
							//jQuery(this).slider( 'option', 'min', value[0] );
							//jQuery(this).slider( 'option', 'max', value[1] );
							jQuery(this).slider( 'option', 'values', [ value[0], value[1] ] );
							jQuery(this).slider( 'value', jQuery(this).slider('value') );
						});
					}
					
					break;
				}
				case 'text' :
				case 'search' : {
					_this.find('input').val( self.decode( decodeURIComponent( value[0] ) ) );
					
					break;
				}
				case 'slider' : {
					if( [ 'weight', 'width', 'height', 'length' ].indexOf( seoName ) > -1 ) {
						value = value.sort(function(a,b){
							return parseFloat( a ) - parseFloat( b );
						});
					}
					
					self._sliders[_this.attr('data-slider-id')].setValues(value);
					
					break;
				}
			}
		});
		
		//for( var i = 0; i < self._sliders.length; i++ ) {
		//	self._sliders[i].setValues();
		//}
	},
	
	/**
	 * Show loader
	 */
	_showLoader: function( forceOverFilter, nextPage ) {
		var self = this;
				
		if( self._jqLoader == null && ( forceOverFilter !== true || self._options.showLoaderOverResults ) ) {
			self.__initLoader();
		}
		
		if( self._jqLoaderFilter == null && ( forceOverFilter === true || self._options.showLoaderOverFilter ) ) {
			self.__initLoaderFilter();
		}
		
		if( forceOverFilter !== true && self._options.showLoaderOverResults ) {
			(function(){
				var w = self._jqContent.outerWidth(),
					h = self._jqContent.outerHeight(),
					j = self._jqContent.find('.product-list'),
					k = j.length ? j : self._jqContent.find('.product-grid'),
					l = k.length ? k : self._jqContent,
					t = k.length ? k.offset().top - 150 : l.offset().top;

				self._jqLoader
					.css('width', w + 'px')
					.css('height', h + 'px')
					.fadeTo('normal', 1)
					.find('img')
					.css('margin-top', t + 'px');
			})();
		}
		
		if( forceOverFilter === true || self._options.showLoaderOverFilter ) {
			(function(){
				var w = self._box.outerWidth(),
					h = self._box.outerHeight();
				
				self._jqLoaderFilter
					.css('width', w + 'px')
					.css('height', h + 'px')
					.fadeTo('normal',1);
			})();
		}
		
		if( forceOverFilter !== true ) {
			if( self._options.autoScroll && nextPage !== true ) {
				jQuery('html,body').stop().animate({
					scrollTop: self._jqContent.offset().top + self._options.addPixelsFromTop
				}, 'low', function(){
					//self._busy = false;
					self.render();
				});
			} else {
				//self._busy = false;
				self.render();
			}
		}
	},
	
	/**
	 * Hide loader
	 */
	_hideLoader: function() {
		var self = this;
		
		if( self._jqLoader !== null ) {		
			self._jqLoader.remove();
			self._jqLoader = null;
		}
		
		if( self._jqLoaderFilter !== null ) {
			self._jqLoaderFilter.remove();
			self._jqLoaderFilter = null;
		}
	},
	
	/**
	 * Render data
	 */
	render: function( history, nextPage ) {
		var self = this;
		
		if( self._lastResponse === '' || self._busy ) {
			return;
		}
		
		self._hideLoader();
		
		// remove all links to scripts JS
		self._lastResponse = self._lastResponse.replace( /<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi, '' );
		
		var tmp = jQuery('<tmp>').html( self._lastResponse ),
			content = tmp.find(self._contentId), // find main container
			json = tmp.find('#mfilter-json'); // information JSON containing data on the number of products by category
			
		if( ! content.length && self._contentId != '#content' ) {
			content = tmp.find('#content');
		}
			
		if( content.length ) {
			var styles = self._jqContent.html().match( /<style\b[^<]*(?:(?!<\/style>)<[^<]*)*<\/style>/gi );
			
			if( styles != null && styles.length ) {
				for( var i = 0; i < styles.length; i++ ) {
					jQuery('head:first').append( styles[i] );
				}
			}
			
			self._render( content.html(), json && json.length ? self.base64_decode(json.html()) : null, history, nextPage );
			
			self._lastResponse = '';
		} else {
			self.reload();
		}
	},
	
	urlToSeo: function( u, data ){
		var self = this,
			url = '',
			reg = new RegExp(self._options.seo.parameter+'=([^&]+)'),
			mfp, mfp_url;
		
		url += u.scheme && u.host ? u.scheme + ':' : '';
		url += u.host ? '//' + u.host : '';
		url += u.port ? ':' + u.port : '';
		url += typeof u.path != 'undefined' ? self.removeMfpFromUrl( decodeURIComponent( u.path ) ) : '/';
		
		if( data && typeof data['url_alias'] != 'undefined' ) {
			self._seoAliases[self.filtersToUrl( undefined, true )] = data['url_alias'];
		}
		
		if( ( self._options.seo.enabled || self._options.seo.aliasesEnabled ) && typeof u.query != 'undefined' && u.query && null != ( mfp = u.query.match( reg ) ) ) {
			url = url.replace( /\/$/, '' );
			
			if( mfp ) {
				mfp = mfp[1];
				
				//mfp_url = mfp.replace( new RegExp( "(,?)path\[" + self.reg_exp_quote( self._path() ) + "\](,?)", "g" ), '$1$2' );
				//mfp_url = mfp_url.replace( '],,', '],' ).replace( /^,|,$/, '' );
				
				if( self._options.seo.enabled || typeof data['url_alias'] != 'undefined' ) {
					url += ! data || typeof data['url_alias'] == 'undefined' ? '/' + self._options.seo.separator + '/' + mfp : '/' + data['url_alias'];
				}

				if( self._options.seo.addSlashAtTheEnd && ! /\/$/.test( url ) ) {
					url += '/';
				}

				u.query = u.query.replace( self._options.seo.parameter + '=' + mfp, '' );
				u.query = u.query.replace( /^(\?|&)|&$/g, '' );
				u.query = u.query.replace( /&&/g, '&' );
			}

			if( self._options.seo.addSlashAtTheEnd && ! /\/$/.test( url ) ) {
				url += '/';
			}

			if( u.query != '' ) {
				url += '?' + u.query;
			}
			
			if( ! self._options.seo.enabled && typeof data['url_alias'] == 'undefined' ) {
				url += typeof u.query == 'undefined' || u.query == '' ? '?' : '&';
				url += self._options.seo.parameter + '=' + self.filtersToUrl();
			}

			self._lastUrl = url;
		} else if( data && typeof data['url_alias'] != 'undefined' ) {
			url = url.replace( /\/$/, '' );
			url += '/' + data['url_alias'];
			
			if( self._options.seo.enabled && self._options.seo.addSlashAtTheEnd && ! /\/$/.test( url ) ) {
				url += '/';
			}
			
			if( typeof u.query != 'undefined' && u.query != '' ) {
				url += '?' + u.query;
			}
		} else {
			url = url.replace( /\/$/, '' );
			
			if( self._options.seo.enabled ) {
				var filters = self.filtersToUrl();
				
				if( filters ) {
					url += '/' + self._options.seo.separator + '/' + self.filtersToUrl();
				}
			}
			
			if( self._options.seo.enabled && self._options.seo.addSlashAtTheEnd && ! /\/$/.test( url ) ) {
				url += '/';
			}
			
			if( typeof u.query != 'undefined' && u.query != '' ) {
				url += '?' + u.query;
			}
			
			if( ! self._options.seo.enabled ) {
				var filters = self.filtersToUrl( undefined, true );
				
				if( filters ) {
					url += typeof u.query == 'undefined' || u.query == '' ? '?' : '&';
					url += self._options.seo.parameter + '=' + self.filtersToUrl( undefined, true );
				}
			}
		}
		
		return url;
	},
	
	_render: function( html, json, history, nextPage ) {
		var self = this;
		
		if( history !== true ) {
			self._lastUrl = self.createUrl();
			
			if( self._ajaxPagination !== null ) {
				self._lastUrl += self._lastUrl.indexOf( '?' ) > -1 ? '&' : '?';
				self._lastUrl += 'page=' + self._ajaxPagination;
				
				self._ajaxPagination = null;
			}
			
			self._urlToFilters = null;
			
			if( self._options.seo.enabled || self._options.seo.aliasesEnabled ) {
				var u = self.parse_url( self._lastUrl ),
					data = jQuery.parseJSON( json || '{}' ),
					url = self.urlToSeo(u, data);
				
				if( typeof data['url_alias'] != 'undefined' ) {
					self._seoAliases[self.filtersToUrl( undefined, true )] = data['url_alias'];
				}
				
				if( self._options.seo.enabled && typeof u.query != 'undefined' && u.query ) {
					self._lastUrl = url;
				} else if( typeof data['url_alias'] != 'undefined' ) {
					self._lastUrl = url;
				}
			}
			
			try {
				window.history.pushState({
					'html'	: html,
					'json'	: json,
					'url'	: self._lastUrl
				}, '', self._lastUrl );
				
				self._history++;
			} catch( e ) {}
		}
		
		if( json ) {
			self.eachInstances(function( self ){
				self._parseInfo( json );
				self.checkValueLinks();
			});
		}
		
		self.beforeRender( self._lastResponse, html, json );
		
		var listOfProducts = '';
		
		if( nextPage ) {
			listOfProducts = jQuery(self._options.contentSelectorProduct).parent().html();
		}
					
		self._jqContent.html( html );
		
		if( nextPage ) {
			jQuery(self._options.contentSelectorProduct).parent().prepend( listOfProducts );
		} else {
			self.updatePages();
		}
			
		/*if( self._box.hasClass( 'mfilter-content_top' ) ) {
			self._jqContent.prepend( self._box.removeClass('init') );
			self.init( self._box, self._options );
		}*/
			
		(function(){
			var d = null;
			if( typeof jQuery.totalStorage == 'function' && jQuery.totalStorage('display') ) {
				d = jQuery.totalStorage('display');
			} else if( typeof jQuery.cookie == 'function' && jQuery.cookie('display') ) {
				d = jQuery.cookie('display');
			} else {
				try {
					if( typeof localStorage === 'object' && localStorage.getItem('display') ) {
						d = localStorage.getItem('display');
					}
				} catch( e ) {}
			}
			display_MFP( d || 'list' );
			try {
				var $box = jQuery('#mfilter-content-container');
				if( ! $box.length ) {
					$box = jQuery('#content');
				}
				$box.find('.row_s').addClass('view');
			} catch( e2 ) {}
		})();
			
		for( var i in self ) {
			if( i.indexOf( '_initAlways' ) === 0 && typeof self[i] == 'function' ) {
				self[i]();
			}
		}
		
		for( var f = 0; f < self._liveFilters.length; f++ ) {
			self._liveFilters[f].check();
		}
		
		// Support for Product Quantity Extension (15186)
		if( typeof pq_initExt == 'function' ) {
			pq_initExt();
		}
		
		if( self._options.routeHome == self._options.route && self._options.homePageAJAX ) {
			self._jqContent.find('.pagination > li > a').unbind('click').bind('click', function(){
				self.ajax( jQuery(this).attr('href') );
				
				return false;
			});
		}
		
		if( self._relativeScroll ) {
			self._relativeScroll.reinit();
		}
		
		self.afterRender( self._lastResponse, html, json );
	},
	
	_initAlwaysMetaRobots: function(){
		var self = this;
		
		if( ! self._lastUrl || ! self._options.seo.metaRobots ) return;
		
		var filters = self.filters();
		
		self.eachInstances(function( self ){
			filters = jQuery.extend(filters, self.filters());
		}, true);
		
		if( ! self.count( filters ) ) {
			$('head meta[name=robots]').remove();
		} else {
			var url = self.removeMfpFromUrl( self._lastUrl );
			
			if( url.length < self._lastUrl.length ) {
				if( ! $('head meta[name=robots]').length ) {
					$('head').append($('<meta name="robots">').attr('content', self._options.seo.metaRobotsValue));
				}
			} else {
				$('head meta[name=robots]').remove();
			}
		}
	},
	
	beforeRequest: function(){},
	
	beforeRender: function(){},
	
	afterRender: function(){},
	
	eachInstances: function( fn, skipCurrent ) {
		for( var i = 0; i < MegaFilterINSTANCES.length; i++ ) {
			if( skipCurrent === true && i == this._instanceIdx ) continue;
			
			fn( MegaFilterINSTANCES[i] );
		}
	},
	
	checkValueLinks: function(){
		var self = this;
		
		if( ! self._options.seo.valuesAreLinks ) { 
			return;
		}
		
		var params = self.filters( false, false ),
			urlParams = self._parseUrl( document.location.href.toString(), {} ),
			currentUrl = self.parse_url( MegaFilterCommonData.seo.currentUrl ),
			baseUrl = '';
		
		baseUrl += currentUrl.host ? '//' + currentUrl.host : '';
		baseUrl += currentUrl.port ? ':' + currentUrl.port : '';
		
		if( self._options.routeHome == self._options.route && ! self._options.homePageAJAX ) {
			if( currentUrl.query && currentUrl.query.indexOf( 'route=common/home' ) >= 0 ) {
				baseUrl += currentUrl.path ? currentUrl.path : '/';
				
				currentUrl.query = currentUrl.query.replace( 'route=common/home', 'route=module/mega_filter/results' );
			} else if( currentUrl.path == 'common/home' || ! currentUrl.path ) {
				baseUrl += 'module/mega_filter/results';
			}
		} else {
			baseUrl += currentUrl.path ? currentUrl.path : '/';
		}

		self.eachInstances(function( self ){
			params = jQuery.extend( self.filters( false, false ), params );
		}, true);
		
		if( typeof urlParams[self._options.seo.parameter] != 'undefined' ) {
			urlParams = self.__urlToFilters( urlParams[self._options.seo.parameter] );
			params = jQuery.extend( params, urlParams );
		}
		
		self.eachInstances(function( self ){
			jQuery(self._box).find('li[data-seo-name]').each(function(){
				var name = jQuery(this).attr('data-seo-name'),
					type = jQuery(this).attr('data-type');

				jQuery(this).find('a.mfp-value-link').each(function(){
					var $self = jQuery(this),
						href = (function(){
							if( $self.attr('data-href') ) {
								return $self.attr('data-href');
							}

							return /*decodeURIComponent*/( $self.attr('href') );
						})(),
						value = $self.attr('data-value')||'',
						new_url = type == 'tree' ? href : baseUrl,
						copy = jQuery.extend( true, {}, params ),
						query = (currentUrl.query ? currentUrl.query : '').replace( /&?page=[0-9]+/, '' );
					
					if( $self.hasClass('mfp-value-link-disabled') ) {
						new_url = '#';

						if( ! $self.attr('data-href') ) {
							$self.attr('data-href', $self.attr('href'));
							$self.attr('href', '#');
						}
					} else {
						if( $self.attr('data-href') ) {
							$self.attr('href', $self.attr('data-href'));
							$self.removeAttr('data-href');
						}
						
						if( typeof copy[name] != 'undefined' ) {
							var tmp = [],
								idx = -1;

							for( var i = 0; i < copy[name].length; i++ ) {
								if( self.decode( decodeURIComponent( copy[name][i] ) ) == value ) {
									idx = i;
								} else {
									tmp.push( copy[name][i] );
								}
							}

							if( idx > -1 ) {
								if( tmp.length ) {
									copy[name] = tmp;
								} else {
									if( name == 'stock_status' && ( self._options.inStockDefaultSelected || self._options.inStockDefaultSelectedGlobal ) ) {
										copy[name] = [ 0 ];
									} else {
										delete copy[name];
									}
								}
							} else if( type == 'radio' || type == 'image_radio' || type == 'image_list_radio' ) {
								copy[name] = [ encodeURIComponent( self.encode( value ) ) ];
							} else {
								if( name == 'stock_status' && copy[name].length == 1 && copy[name][0] == 0 ) {
									copy[name] = [];
								}
								
								copy[name].push( encodeURIComponent( self.encode( value ) ) );
							}
						} else if( type != 'tree' ) {
							copy[name] = [ encodeURIComponent( self.encode( value ) ) ];
						}
						
						copy = self.sortParamsForSeoAlias( copy );
						
						var copy_key = self.filtersToUrl( copy, true );
						
						if( typeof MegaFilterCommonData.seo.aliases[copy_key] == 'undefined' ) {
							copy_key = decodeURIComponent( copy_key );
						}
						
						if( typeof MegaFilterCommonData.seo.aliases[copy_key] != 'undefined' ) {
							new_url = new_url.replace( /\/+$/, '' ) + '/' + MegaFilterCommonData.seo.aliases[copy_key];
							
							if( self._options.seo.enabled && self._options.seo.addSlashAtTheEnd && ! /\/$/.test( new_url ) ) {
								new_url += '/';
							}
						} else {
							if( self.count( copy ) ) {
								if( self._options.seo.enabled ) {
									new_url = new_url.replace( /\/+$/, '' ) + '/' + self._options.seo.separator + '/' + self.filtersToUrl( copy );
									
									if( self._options.seo.addSlashAtTheEnd && ! /\/$/.test( new_url ) ) {
										new_url += '/';
									}
								} else {
									if( query != '' ) {
										query += '&';
									}

									query += self._options.seo.parameter + '=' + self.filtersToUrl( copy );
								}
							}
						}

						new_url += query ? '?' + query : '';
					}
					
					jQuery(this).attr('href', new_url.replace(/&amp;/g, '&'));
				});
			});
		});
	},
	
	sortParamsForSeoAlias: function( params ){
		var self = this;
		
		params = self.sortObjByKeys( params );
		
		for( var i in params ) {
			var type = self._box.find('[data-seo-name="' + i + '"]').attr('data-type');
			
			if( type != 'slider' && type != 'price' && type != 'related' && type != 'tree' && i != 'level' && type != 'vehicles' ) {
				params[i] = params[i].sort(function(a,b){
					return a.toString().localeCompare(b);
				});
			}
		}
		
		return params;
	},
	
	sortObjByKeys: function( params ) {
		var keys = [],
			obj = {},
			i, j;
		
		for( i in params ) {
			keys.push( i );
		}
		
		keys.sort(function(a,b){
			return a.toString().localeCompare(b);
		});
		
		for( i = 0; i < keys.length; i++ ) {
			/*var vals = [];
			
			for( j = 0; j < params[keys[i]].length; j++ ) {
				vals.push( decodeURIComponent( params[keys[i]][j] ) );
			}*/
			
			obj[keys[i]] = params[keys[i]];
		}
		
		return obj;
	},
	
	/**
	 * Load datas
	 */
	ajax: function( url, history, nextPage ) {
		var self = this;
		
		if( self._busy ) {
			self._waitingChanges = true;
			
			return;
		}
		
		(function(){
			var filters = self.filters( true );
			
			self.eachInstances(function( self ){
				var params = jQuery.extend( self.filters(), filters );
				
				if( typeof filters.path == 'undefined' ) {
					params.path = [self._path()];
				}
				
				self.setFiltersByUrl( params );
			}, true);
		})();
		
		if( typeof url == 'undefined' || url === null ) {
			url = [ self._options.routeProduct, self._options.routeHome, self._options.routeInformation, self._options.routeManufacturerList ].indexOf( self._options.route ) > -1 ? self.createUrl( self._options.ajaxResultsUrl, undefined, undefined, ! ( self._options.seo.enabled && self._options.seo.usePostAjaxRequests ) ) : self.createUrl( undefined, undefined, undefined, ! ( self._options.seo.enabled && self._options.seo.usePostAjaxRequests ) );
		} else {
			var mfpUrl = this.filtersToUrl();
			
			url = this.removeMfpFromUrl( url );
			
			if( mfpUrl != '' ) {
				url += ( url.indexOf( '?' ) >= 0 ? '&' : '?' ) + self._options.seo.parameter + '=' + mfpUrl;
			}
		}
		
		var cname = url + self._options.idx;
		
		if( nextPage ) {
			cname += self._ajaxPagination;
		}
		
		if( ( ! self._options.homePageAJAX && self._options.routeHome == self._options.route ) || [ self._options.routeProduct, self._options.routeInformation, self._options.routeManufacturerList ].indexOf( self._options.route ) > -1 ) {
			if( url.indexOf( 'path,' ) < 0 && url.indexOf( 'path[' ) < 0 && self._options.data.category_id !== null ) {
				if( url.indexOf( self._options.seo.parameter + '=' ) < 0 ) {
					url += url.indexOf( '?' ) >= 0 ? '&' : '?';
					url += self._options.seo.parameter + '=';
				} else {
					url += ',';
				}
				url += 'force-path[' + self._options.data.category_id + ']';
			}
			
			window.location.href = url;
			
			return;
		}

		self.eachInstances(function( self ){
			self._busy = true;
			self._lastResponse = '';
		});
		
		self.renderSelectedFilters();
		
		self._showLoader( undefined, nextPage );
		
		if( typeof self._params['page'] != 'undefined' ) {
			delete self._params['page'];
		}
		
		if( ! nextPage ) {
			self._page = 1;
		}
		
		if( typeof MegaFilterCommonData.lastResponse[cname] != 'undefined' ) {
			self.eachInstances(function( self2 ){
				self2._lastResponse = MegaFilterCommonData.lastResponse[cname];
			});
			
			setTimeout(function(){
				self.eachInstances(function( self ){
					self._busy = false;
				});
				
				self.render( history, nextPage );
			}, 100);
			
			return;
		}
		
		if( self.beforeRequest() === false ) {
			return;
		}
		
		url = self._ajaxUrl( url );
		url = self.getToPost( url );
		
		self._changed = true;
		
		if( nextPage ) {
			url.url += url.url.indexOf('?') > -1 ? '&' : '?';
			url.url += 'page=' + self._ajaxPagination;
		}
		
		jQuery.ajax({
			'type'		: self._options.seo.enabled && self._options.seo.usePostAjaxRequests ? 'POST' : 'GET',
			'url'		: url.url,
			'timeout'	: 60 * 1000,
			'cache'		: false,
			'data'		: jQuery.extend({
				'mfilterAjax'	: '1',
				'mfilterIdx'	: self._options.idx,
				'mfilterBTypes'	: self.baseTypes().join(','),
				'mfilterPath'	: self._path(),
				'mfilterLPath'	: self.locationPath()
			}, url.data),
			'success'	: function( response ) {
				self.eachInstances(function( self ){
					self._busy = false;
				});
				
				if( response ) {
					MegaFilterCommonData.lastResponse[cname] = response;
					
					self.eachInstances(function( self ){
						self._lastResponse	= response;
					});
					
					self.render( history, nextPage );
					
					if( self._waitingChanges ) {
						self._waitingChanges = false;
						self.ajax();
					}
				} else {
					self.reload();
				}
			},
			'error'		: function() {
				self.reload();
			}
		});
	},
	
	/**
	 * Create full URL
	 */
	createUrl: function( url, attribs, force, ajax ) {
		if( typeof ajax == 'undefined' && typeof url != 'undefined' && url.indexOf('index.php?') > -1 ) {
			ajax = true;
		}
		
		var self	= this,
			params	= self.paramsToUrl( url, attribs ),
			filters	= self.filtersToUrl( undefined, ajax ),
			urlSep	= self._urlSep;
		
		if( typeof url == 'undefined' ) {
			url = self._url;
		} else {
			urlSep = self._parseSep( url.split('#')[0] ).urlSep;
			url = self._parseSep( url.split('#')[0] ).url;
		}
		
		url = self.removeMfpFromUrl( decodeURIComponent( url ) );
		url = url.replace( /(\/?page-[0-9]+|\/page\/[0-9]+\/|\/page\/[0-9]+$)/, '' );
		
		if( params || filters ) {
			if( ! ajax && filters && self._options.seo.enabled ) {
				if( ! /\/$/.test( url ) ) {
					url += '/';
				}
				
				url += self._options.seo.separator + '/' + filters;
			}
			
			if( params || ajax || ! self._options.seo.enabled ) {
				url += urlSep.f;
			}
			
			if( params ) {
				url += params;
			}
			
			if( ajax || ! self._options.seo.enabled ) {
				if( filters ) {
					if( params ) {
						url += urlSep.n;
					}
					
					url += self._options.seo.parameter + ( urlSep.n == '&' ? '=' : urlSep.n ) + filters;
				} else if( force ) {
					var mfp = self.filtersToUrl( self.urlToFilters() );

					if( mfp ) {
						url += urlSep.n;
						url += self._options.seo.parameter + ( urlSep.n == '&' ? '=' : urlSep.n ) + mfp;
					}
				}
			}
		}
		
		if( self._options.seo.enabled && self._options.seo.addSlashAtTheEnd ) {
			var u = self.parse_url( url );
			
			if( u.path != '/index.php' && ! /\/$/.test( u.path ) ) {
				u.path += '/';
			}
			
			url = ( u.scheme && u.host ? u.scheme + ':' : '' ) + ( u.host ? '//' + u.host : '' ) + (u.port ? ':'+u.port: '') + u.path;
			
			if( u.query && u.query != '' ) {
				url += '?' + u.query;
			}
		}
		
		return url;
	},
	
	/**
	 * Check correct entered price range
	 * 
	 * @return bool
	 */
	_validPrice: function( min, max ) {
		var self = this;
		
		min = parseInt( min );
		max = parseInt( max );
		
		if( min < self._options.priceMin ) {
			min = self._options.priceMin;
		}
		
		if( max > self._options.priceMax ) {
			max = self._options.priceMax;
		}
		
		if( min > max ) {
			return false;
		}
		
		if( min == max && min == self._options.priceMin && max == self._options.priceMax ) {
			return false;
		}
		
		return [ min, max ];
	},
	
	/**
	 * Make parameters from the URL to object
	 * 
	 * @return object
	 */
	urlToFilters: function( force ) {
		if( force !== true && this._urlToFilters !== null ) {
			return this._urlToFilters;
		}
		
		var self = this;
		
		self._urlToFilters = {};
		
		if( ! self._params[self._options.seo.parameter] ) {
			return self._urlToFilters;
		}
		
		try {
			self._params[self._options.seo.parameter] = decodeURIComponent( self._params[self._options.seo.parameter] );
		} catch( e ) {}
		
		self._urlToFilters = self.__urlToFilters( self._params[self._options.seo.parameter] );
		
		return self._urlToFilters;
	},
	
	__urlToFilters: function( mfp ) {
		var self	= this,
			obj		= {},
			matches	= mfp.match( /[a-z0-9\-_]+\[[^\]]+\]/g );
		
		function validValue( key, val ) {
			switch( key ) {
				case 'force-path' : {
					self._options.data.force_category_id = val[0];
					
					return null;
				}
				case 'price' : {
					return val;
						
					/*if( typeof val[0] != 'undefined' && val[1] != 'undefined' ) {
						var price = self._validPrice( val[0], val[1] );
						
						if( price !== false ) {
							return price;
						}
					}
					
					return null;*/
				}
				case 'stock_status' : {
					if( ! val.length || val[0] == '0' ) {
						return [];
					}
					
					return val;
				}
				default : {
					return val;
				}
			}
		}
		
		if( ! matches ) {
			if( self._options.seo.enabled ) {
				matches = mfp.split('/');
				
				for( var i = 0; i < matches.length; i++ ) {
					var val = matches[i].split(','),
						key = val.shift();
					
					val = validValue( key, val );
					
					if( val !== null ) {
						obj[key] = val;
					}
				}
			}
			
			return obj;
		}
		
		for( var i = 0; i < matches.length; i++ ) {
			var key = self.trim( matches[i].match( /([^\[]+)\[[^\]]+\]/ )[1], ',' ),
				val = validValue( key, matches[i].match( /[^\[]+\[([^\]]+)\]/ )[1].split(',') );
			
			if( val !== null ) {
				obj[key] = val;
			}
		}
		
		return obj;
	},
	
	trim: function trim (str, charlist) {
		var whitespace = ' \n\r\t\f\x0b\xa0\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u200b\u2028\u2029\u3000',
			l, i;
		
		str += '';

		if( charlist ) {
			whitespace = (charlist + '').replace(/([[\]().?/*{}+$^:])/g, '$1');
		}
		
		l = str.length;
		
		for( i = 0; i < l; i++ ) {
			if( whitespace.indexOf(str.charAt(i)) === -1 ) {
				str = str.substring(i);
				break;
			}
		}

		l = str.length;
		
		for( i = l - 1; i >= 0; i-- ) {
			if( whitespace.indexOf(str.charAt(i)) === -1 ) {
				str = str.substring(0, i + 1);
				break;
			}
		}
		
		return whitespace.indexOf(str.charAt(0)) === -1 ? str : '';
	},
	
	resetFilters: function( renderSelectedFilters, click ){
		var self	= this,
			//params	= self.filters(),
			url		= self.urlToFilters();
		
		self._urlToFilters = null;
		
		if( self._params !== null ) {
			delete self._params[self._options.seo.parameter];
		} else {
			self._params = {};
		}
		
		self._box.find('li[data-type]').each(function(){
			var _this		= jQuery(this),
				type		= _this.attr('data-type'),
				baseType	= _this.attr('data-base-type'),
				seoName		= _this.attr('data-seo-name'),
				value		= typeof url[seoName] == 'undefined' ? [] : url[seoName],
				defaultVal	= null;
				
			_this.find('.mfilter-input-active').removeClass('mfilter-input-active');
			
			if( 
				baseType == 'stock_status' 
					&& 
				( 
					self._options.inStockDefaultSelected && self._options.inStockDefaultSelectedGlobal
				) 
			) {
				if( typeof url.stock_status == 'undefined' || click /*|| params.stock_status[0] == '0'*/ ) {
					defaultVal = typeof self._options.inStockStatusSelected == 'undefined' ? [ self._options.inStockStatus ] : self._options.inStockStatusSelected;
				}
			}
			
			switch( type ) {
				case 'image_radio' :
				case 'image' : {
					_this.find('input[type=checkbox]:checked,input[type=radio]:checked').prop('checked', false).parent().removeClass('mfilter-image-checked');
					
					break;
				}
				case 'cat_checkbox' : {
					_this.find('input[type=checkbox]:checked').prop('checked', false);
					_this.find('.mfilter-counter').removeClass('mfilter-close');
					
					break;
				}
				case 'tree' : {
					_this.find('input[name=path]').val( typeof self._options.params.path_aliases == 'undefined' ? ( typeof self._options.params.path == 'undefined' ? '' : self._options.params.path ) : self._options.params.path_aliases );
					
					break;
				}
				case 'rating' :
				case 'stock_status' :
				case 'manufacturers' :
				case 'discounts' :
				case 'checkbox' : 
				case 'image_list_checkbox' : 
				case 'image_list_radio' : 
				case 'radio' : {
					_this.find('input[type=checkbox]:checked,input[type=radio]:checked').prop('checked', false);
					_this.find('.mfilter-counter').removeClass('mfilter-close');
					
					if( defaultVal !== null ) {
						if(baseType!='stock_status') {
							defaultVal = [ defaultVal ];
						}
						
						for( var i = 0; i < defaultVal.length; i++ ) {
							_this.find('input[value="' + defaultVal[i].replace( /"/g, '&quot;' ) + '"]').prop('checked', true)
								.parent().parent().find('.mfilter-counter').addClass('mfilter-close');
						}
					}
					
					break;
				}
				case 'search_oc' :
				case 'search' : {
					_this.find('input[id="mfilter-opts-search"]').val( '' );
						
					break;
				}
				case 'text' : {
					_this.find('input[type=text]').val( '' );
					
					break;
				}
				case 'slider' : {					
					
					
					break;
				}
				case 'price' : {
					_this.find('input[id="mfilter-opts-price-min"]').val( self._options.priceMin );
					_this.find('input[id="mfilter-opts-price-max"]').val( self._options.priceMax );
					_this.find('[id="mfilter-price-slider"]').each(function(){					
						jQuery(this).slider( 'option', 'min', self._options.priceMin );
						jQuery(this).slider( 'option', 'max', self._options.priceMax );
						jQuery(this).slider( 'option', 'values', [ self._options.priceMin, self._options.priceMax ] );
						jQuery(this).slider( 'value', jQuery(this).slider('value') );
					});
					
					break;
				}
				case 'levels' :
				case 'vehicles' : 
				case 'related' :
				case 'select' : {
					if( ( self._isInit && click ) || type != 'related' ) {
						_this.find('select option').removeAttr('selected');

						if( defaultVal !== null ) {
							_this.find('select option').each(function(i){
								if( jQuery(this).val() == defaultVal ) {
									jQuery(this).attr('selected', true);
									_this.find('select').prop('selectedIndex', i);

									return false;
								}
							});
						} else {
							_this.find('select option:first').attr('selected', true);
							_this.find('select').prop('selectedIndex', 0);
						}
					}
					
					if( type == 'related' ) {
						_this.find('select').each(function(i){
							if( ( ( ! click && i >= value.length && value.length ) || click ) && i ) {
								if( _this.attr('data-auto-levels') ) {
									jQuery(this).parent().remove();
								} else {
									jQuery(this).find('option[value!=""]').remove();
								}
							}
						});
					}

					_this.find('select.mf_selectpicker').mf_selectpicker('refresh');
					
					break;
				}
			}
		});
		
		for( var i = 0; i < self._sliders.length; i++ ) {
			self._sliders[i].resetValues();
		}
		
		if( renderSelectedFilters !== false ) {
			self.renderSelectedFilters();
		}
	},
	
	/**
	 * Get current values of all filters
	 * 
	 * @return object
	 */
	filters: function( alsoEmpty, ajax ) {
		var self	= this,
			params	= { },
			stockStatusExist = self._box.find('li[data-base-type="stock_status"]').length ? true : false;
		
		if( typeof self._options.data.force_category_id != 'undefined' ) {
			params['path'] = [ self._options.data.force_category_id ];
		}
				
		self._box.find('li[data-type]').each(function(){
			var _this	= jQuery(this),
				type	= _this.attr('data-type'),
				seoName	= _this.attr('data-seo-name');
				
			if( alsoEmpty === true ) {
				if( typeof params[seoName] == 'undefined' ) {
					params[seoName] = [];
				}
			}
			
			switch( type ) {
				case 'cat_checkbox' : 
				case 'rating' :
				case 'stock_status' : 
				case 'manufacturers' :
				case 'discounts' :
				case 'image_list_checkbox' :
				case 'image' :
				case 'checkbox' : {
					_this.find('input[type=checkbox]:checked').each(function(){
						if( typeof params[seoName] == 'undefined' ) {
							params[seoName] = [];
							
							/*if( type == 'cat_checkbox' ) {
								if( typeof self._options.params.mfp_org_path != 'undefined' ) {
									params[seoName].push( self._options.params.mfp_org_path );
								} else if( typeof self._options.params.path != 'undefined' ) {
									params[seoName].push( self._options.params.path );
								}
							}*/
						}
						
						params[seoName].push( encodeURIComponent( self.encode( jQuery(this).val() ) ) );
					});
					
					break;
				}
				case 'image_radio' :
				case 'image_list_radio' :
				case 'radio' : {
					_this.find('input[type=radio]:checked').each(function(){
						params[seoName] = [ encodeURIComponent( self.encode( jQuery(this).val() ) ) ];
					});
						
					break;
				}
				case 'slider' : {
					var slider_id = _this.attr('data-slider-id'),
						slider_vals = self._sliders[slider_id].getValues();
					
					if( slider_vals.length ) {
						params[seoName] = slider_vals;
					}
					
					break;
				}
				case 'price' : {
					var priceRange = self.getPriceRange();
					
					if( priceRange.min != self._options.priceMin || priceRange.max != self._options.priceMax ) {
						var price = self._validPrice( priceRange.min, priceRange.max );
						
						if( price !== false ) {
							params[seoName] = price;
						}
					}
					
					break;
				}
				case 'search_oc' :
				case 'search' : {
					_this.find('input[id="mfilter-opts-search"]').each(function(){
						if( jQuery(this).val() !== '' ) {
							params[seoName] = [ encodeURIComponent( self.encode( jQuery(this).val() ) ) ];
						}
					});
					
					break;
				}
				case 'text' : {
					_this.find('input[type=text]').each(function(){
						if( jQuery(this).val() != '' ) {
							params[seoName] = [ encodeURIComponent( self.encode( jQuery(this).val() ) ) ];
						}
					});
					
					break;
				}
				case 'select' : {
					_this.find('select').each(function(){
						if( jQuery(this).val() )
							params[seoName] = [ encodeURIComponent( self.encode( jQuery(this).val() ) ) ];
					});
						
					break;
				}
				case 'levels' :
				case 'vehicles' :
				case 'related' : {
					//if( _this.find('select:last').val() ) {
						_this.find('select').each(function(){
							var val = jQuery(this).val();
							
							if( val ) {							
								if( typeof params[seoName] == 'undefined' )
									params[seoName] = [];

								params[seoName].push( val );
							} else if( jQuery(this).attr('data-type') == 'vehicle-engines' ) {
								if( _this.find('select[data-type="vehicle-years"]').val() ) {
									params[seoName].push( '0' );
								}
							}
						});
					//}
				}
				case 'tree' : {
					_this.find('input').each(function(){
						var val = jQuery(this).val();
						
						if( val ) {
							params['path'] = [ val ];
						}
					});
					
					break;
				}
			}
		});
		
		// check that the default should be selected "in stock"
		if( typeof params.stock_status == 'undefined' ) {
			if( self._options.inStockDefaultSelected && ! self._options.inStockDefaultSelectedGlobal && ! self._stockStatusInited ) {
				if( self.count( params ) ) {
					self._stockStatusInited = true;
					
					params.stock_status = self._options.inStockStatus.split(',');
					
					for( var i = 0; i < params.stock_status.length; i++ ) {
						self._box.find('[data-base-type=stock_status] input[value="' + params.stock_status[i] + '"]').prop('checked', true).parent().parent().find('.mfilter-counter').addClass('mfilter-close');
					}
				}
			} else if( ( self._options.inStockDefaultSelected || self._options.inStockDefaultSelectedGlobal ) && typeof params['stock_status'] == 'undefined' ) {
				params.stock_status = stockStatusExist ? [ 0 ] : self._options.inStockStatus.split(',');
			}
		}
		
		if( ! ajax && typeof params.path != 'undefined' ) {
			if( typeof self._seoAliases[self.filtersToUrl(params)] != 'undefined' && params.path == self._path() ) {
				delete params['path'];
			} else if( typeof self._options.params.path_aliases != 'undefined' && params.path == self._options.params.path_aliases ) {
				delete params['path'];
			} else if( typeof self._options.params.path != 'undefined' && params.path == self._options.params.path ) {
				delete params['path'];
			}
		}
		
		return params;
	},
			
	/**
	 * Create a URL based on parameters
	 */
	filtersToUrl: function( params, ajax, encode_params ) {
		var self	= this,
			url		= '';
		
		if( typeof params == 'undefined' ) {
			params	= self.filters( false, ajax );
		
			self.eachInstances(function( self ){
				params = jQuery.extend( self.filters( false, ajax ), params );
			}, true);
		}
		
		if( ! ajax && self._options.seo.enabled ) {
			for( var i in params ) {
				url += url ? '/' : '';
				url += '' + i + ',' + params[i].join(',') /*(function(){
					var out = [];
					
					for( var j = 0; j < params[i].length; j++ ) {
						out.push( encodeURIComponent( params[i][j] ) );
					}
					
					return out.join(',');
				})()*/;
			}
		} else {
			for( var i in params ) {
				url += url ? ',' : '';
				url += '' + i + '[' + /*encodeURIComponent*/( params[i].join(',') ) + ']';
			}
		}
			
		return url;
	},
	
	/**
	 * Make parameters to the URL
	 * 
	 * @return string
	 */
	paramsToUrl: function( url, attribs ) {
		var self	= this,
			params	= typeof url == 'undefined' ? self._params : self._parseUrl( url, attribs ),
			urlSep	= typeof url == 'undefined' ? self._urlSep : self._parseSep( url ).urlSep;
		
		return self._paramsToUrl( params, {
			'skip'	: [ 'mfilter-ajax', self._options.seo.parameter, 'page' ],
			'sep'	: urlSep.n,
			'sep2'	: urlSep.n == '&' ? '=' : urlSep.n,
			'fn'	: function( i ) {
				return typeof url == 'undefined' && typeof self._inUrl[i] == 'undefined';
			}
		});
	},
	
	_paramsToUrl: function( params, o ) {
		var url = '';
		
		o = jQuery.extend({
			'skip'	: [],
			'sep'	: '&',
			'sep2'	: '=',
			'fn'	: function(){}
		}, typeof o == 'object' ? o : {});
		
		for( var i in params ) {
			if( o.skip.indexOf( i ) > -1 ) continue;
			
			if( o.fn( i, params[i] ) ) continue;
			
			url += url ? o.sep : '';
			url += i + o.sep2 + params[i];
		}
		
		return url;
	},
		
	/**
	 * @param url string
	 * @param attribs object
	 * @return object
	 */
	_parseUrl: function( url, attribs ) {		
		if( typeof attribs != 'object' )
			attribs = {
				'mfilter-ajax'	: '1'
			};
		
		if( typeof url == 'undefined' )
			return attribs;
			
		var self	= this,
			reg		= new RegExp('/'+self._options.seo.parameter+',([a-z0-9\-_]+\[[^\]]*\],?)+', 'g'),
			params, i, name, value, param,
			mfp;
		
		url = url.split('#')[0].replace(/\/$/, '');
		mfp = url.match( reg );
		
		if( mfp ) {
			var reg1 = new RegExp('^/'+self._options.seo.parameter+',');
			
			attribs[self._options.seo.parameter] = mfp[0].split('?')[0].replace( reg1, '' );
		} else {
			var reg1 = new RegExp('/'+self._options.seo.separator+'/([a-z0-9\-_]+,[^/]+/?)+', 'g');
			
			mfp = url.match( reg1 );
			
			if( mfp ) {
				var reg2 = new RegExp('^/'+self._options.seo.separator+'/');
				
				attribs[self._options.seo.parameter] = mfp[0].split('?')[0].replace( reg2, '' ).replace( /^\/+|\/+$/, '' );
			}
		}
		
		var parsed = self.parse_url( url );
		
		if( typeof attribs[self._options.seo.parameter] == 'undefined' && parsed.path && parsed.path != 'index.php' && parsed.path != '/index.php' ) {
			var parts = parsed.path.replace( self.parse_url( MegaFilterCommonData.seo.currentUrl ).path, '' ).split('/');
			
			if( parts.length && parts[parts.length-1] != '' ) {
				var alias = parts[parts.length-1];
				
				for( i in MegaFilterCommonData.seo.aliases ) {
					if( alias == MegaFilterCommonData.seo.aliases[i] ) {
						attribs[self._options.seo.parameter] = i;
						
						break;
					}
				}
			}
		}
		
		if( url.indexOf( '?' ) > -1 || url.indexOf( '&' ) > -1 ) {
			params = typeof parsed.query != 'undefined' ? parsed.query.split('&') : url.split('&');
			
			for( i = 0; i < params.length; i++ ) {
				if( params[i].indexOf( '=' ) < 0 ) continue;
				
				param	= params[i].split('=');
				name	= param[0];
				value	= param[1];

				if( ! name ) continue;

				attribs[name] = value;
			}
		} else {
			params	= url.split( ';' );
			name	= null;
				
			for( i = 1; i < params.length; i++ ) {
				if( name === null )
					name = params[i];
				else {
					attribs[name] = params[i];
					name = null;
				}
			}
		}
		
		return attribs;
	},
	
	/**
	 * Reload page
	 */
	reload: function() {
		var self = this;
		
		window.location.href = self.createUrl();
	}
};
var MegaFilterLang = {};

jQuery().ready(function(){			
	jQuery(document).mf_swipe({
		swipe: function( e, direction, distance, duration, fingerCount, fingerData ){
			for( var i = 0; i < MegaFilterINSTANCES.length; i++ ) {
				MegaFilterINSTANCES[i].swipe( e, direction, distance, duration, fingerCount, fingerData );
			}
		},
		preventDefaultEvents: false
	});
});

function display_MFP(view) {
	var ns = '.mfpDisplayLayout';

	function mfpProductRoot() {
		var $c = jQuery('#mfilter-content-container');
		return $c.length ? $c : jQuery('#content');
	}

	function rowSAddView( $root ) {
		$root.find('.row_s').addClass('view');
	}

	jQuery('#list-view').off('click' + ns).on('click' + ns, function() {
		var $root = mfpProductRoot();
		$root.find('.product-grid > .clearfix').remove();
		$root.find('.row > .product-grid').attr('class', 'product-layout product-list col-xs-12');
		rowSAddView( $root );
		if( typeof localStorage === 'object' ) {
			try {
				localStorage.setItem('display', 'list');
			} catch( e ) {}
		}
	});

	jQuery('#grid-view').off('click' + ns).on('click' + ns, function() {
		var $root = mfpProductRoot();
		$root.find('.product-layout > .clearfix').remove();
		var cols = jQuery('#column-right, #column-left').length;
		var gridClass;
		if( cols == 2 ) {
			gridClass = 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12';
		} else if( cols == 1 ) {
			gridClass = 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12';
		} else {
			gridClass = 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12';
		}
		$root.find('.product-list').attr('class', gridClass);
		rowSAddView( $root );
		if( typeof localStorage === 'object' ) {
			try {
				localStorage.setItem('display', 'grid');
			} catch( e ) {}
		}
	});

	var mode = view;
	if( mode === undefined || mode === null || mode === '' ) {
		try {
			if( typeof localStorage === 'object' ) {
				mode = localStorage.getItem('display');
			}
		} catch( e ) {}
	}
	if( mode !== 'list' && mode !== 'grid' ) {
		mode = 'list';
	}
	try {
		if( mode === 'list' && jQuery('#list-view').length ) {
			jQuery('#list-view').trigger('click');
		} else if( jQuery('#grid-view').length ) {
			jQuery('#grid-view').trigger('click');
		}
	} catch( e ) {
		if( jQuery('#grid-view').length ) {
			jQuery('#grid-view').trigger('click');
		}
	}
}