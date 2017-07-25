"use strict";define("flashComponent",["lodash","reactDOM","core","utils","santaProps","image","swfobject"],function(i,t,e,n,o,s){function a(i,t,e,n){var o=!!i.link?m.renderLink(i.link,t,n):{};return o.style={textAlign:e.align},o}function p(i,t,e,n,o){var s={width:t,height:e},a={width:n,height:o};return"fit"===i?u.getContainerSize(s,a,u.fittingTypes.LEGACY_FIT_WIDTH):"stretch"===i?u.getContainerSize(s,a,u.fittingTypes.STRETCH):{width:n,height:o}}function r(i,t){return this.createChildComponent(i,"core.components.Image","noFlashImg",{id:this.props.id+"noFlashImg",ref:"noFlashImg",imageData:i,containerWidth:t.width,containerHeight:t.height,displayMode:u.fittingTypes.LEGACY_FULL})}function h(){window.swfobject.embedSWF(d(this.props.compData,this.props.staticMediaUrl),this.props.id+"flashContainer","100%","100%","10.0.0","playerProductInstall.swf",null,{quality:"high",bgcolor:"#FAFAFA",allowscriptaccess:"never",allowfullscreen:"true",wMode:"transparent",scale:"exactFit",flashVars:"",play:"true",autoplay:"true"},{align:"middle"},l.bind(this)),this.embeddedUri=this.props.compData.uri}function l(i){i.success&&(t.findDOMNode(this.refs.noFlashImgContainer).style.display="none")}function d(i,t){return i.uri?t+"/"+i.uri:""}var c=e.compMixins,m=n.linkRenderer,u=n.imageUtils;return{displayName:"FlashComponent",mixins:[c.skinBasedComp],statics:{useSantaTypes:!0},propTypes:i.assign({staticMediaUrl:o.Types.ServiceTopology.staticMediaUrl.isRequired,linkRenderInfo:o.Types.Link.linkRenderInfo.isRequired,id:o.Types.Component.id.isRequired,compData:o.Types.Component.compData.isRequired,compProp:o.Types.Component.compProp.isRequired,style:o.Types.Component.style.isRequired,rootNavigationInfo:o.Types.Component.rootNavigationInfo.isRequired},o.santaTypesUtils.getSantaTypesByDefinition(s)),getInitialState:function(){return this.embeddedUri=null,{$linkableComponent:!!this.props.compData.link?"link":"noLink"}},componentDidMount:function(){h.call(this)},componentDidUpdate:function(){this.props.compData.uri!==this.embeddedUri&&h.call(this)},getSkinProperties:function(){var i=this.props.compData.placeHolderImage,t=this.props.compProp.displayMode,e=this.props.compData.uri?this.props.compData.width:i.width,n=this.props.compData.uri?this.props.compData.height:i.height,o=p(t,this.props.style.width,this.props.style.height,e,n);return{"":{style:{width:o.width,height:o.height}},link:a(this.props.compData,this.props.linkRenderInfo,this.props.compProp,this.props.rootNavigationInfo),noFlashImg:r.call(this,i,o)}}}});
//# sourceMappingURL=flashComponent.min.js.map