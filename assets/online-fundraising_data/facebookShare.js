"use strict";define("facebookShare",["lodash","react","core","santaProps","socialCommon","utils"],function(e,o,t,a,i,n){return{displayName:"FacebookShare",mixins:[t.compMixins.skinBasedComp,i.socialCompMixin],statics:{useSantaTypes:!0},propTypes:{compData:a.Types.Component.compData.isRequired,style:a.Types.Component.style.isRequired,id:a.Types.Component.id.isRequired,openPopup:a.Types.popup.open.isRequired},getUrlToBeShared:function(){var e="site"===this.props.compData.urlChoice.toLowerCase(),o=this.getSocialUrl(e);return encodeURIComponent(o)},getFacebookSharer:function(){return"http://www.facebook.com/sharer.php?u="},openSharePopup:function(){this.props.openPopup(this.getFacebookSharer()+this.getUrlToBeShared(),"wix_share_to_facebook","width = 635, height = 346, scrollbars = no, status = no, toolbar = no, menubar = no, location = no")},getSkinProperties:function(){return{"":{},facebookShareButton:{parentConst:o.DOM.a,onClick:this.openSharePopup,title:this.props.compData.label,"aria-label":this.props.compData.label,onKeyDown:n.accessibility.keyboardInteractions.activateBySpaceOrEnterButton},label:{children:[this.props.compData.label]},shareButton:{},icon:{}}}}});
//# sourceMappingURL=facebookShare.min.js.map