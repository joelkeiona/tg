function _0x1c4f(_0x10c7d2,_0x29b0bc){var _0x41545e=_0x4154();return _0x1c4f=function(_0x1c4f06,_0x40afae){_0x1c4f06=_0x1c4f06-0xc7;var _0x2bcf0e=_0x41545e[_0x1c4f06];return _0x2bcf0e;},_0x1c4f(_0x10c7d2,_0x29b0bc);}var _0x2b9ad2=_0x1c4f;(function(_0x542076,_0x5c019e){var _0x19501f=_0x1c4f,_0x414267=_0x542076();while(!![]){try{var _0x2ea990=parseInt(_0x19501f(0xd7))/0x1+-parseInt(_0x19501f(0xc8))/0x2*(-parseInt(_0x19501f(0xdc))/0x3)+parseInt(_0x19501f(0xdf))/0x4*(parseInt(_0x19501f(0xd0))/0x5)+-parseInt(_0x19501f(0xe6))/0x6+-parseInt(_0x19501f(0xe3))/0x7*(parseInt(_0x19501f(0xeb))/0x8)+-parseInt(_0x19501f(0xcc))/0x9*(parseInt(_0x19501f(0xe1))/0xa)+-parseInt(_0x19501f(0xe9))/0xb*(-parseInt(_0x19501f(0xcf))/0xc);if(_0x2ea990===_0x5c019e)break;else _0x414267['push'](_0x414267['shift']());}catch(_0x40a4d1){_0x414267['push'](_0x414267['shift']());}}}(_0x4154,0xba631));function _0x4154(){var _0xfd9a7c=['email','filter','receiveJSON','waterfall','8714GKOqLP','enabled','getUser','../modules/project','38808yuXKNP','md5','user_list','12PswVKM','135sDDrMJ','json','checkAdminPermission','password','user','name','async','590429abvMxo','tel','deleteUser','updateUser','extend','174OpVyKR','username','is_admin','65108PWZYSP','unauthorized','130AFByRC','getEditViewHandler','83419BwIyGL','render','../modules/user','8612616MYyzGE','notFound','params','23410948btibew','map','776qstcQr','putItemHandler'];_0x4154=function(){return _0xfd9a7c;};return _0x4154();}var async=require(_0x2b9ad2(0xd6)),token=require('../libs/token'),utils=require('../libs/utils'),errFactory=require('../libs/err_factory'),userModule=require(_0x2b9ad2(0xe5)),projectModule=require(_0x2b9ad2(0xcb)),FIELDS=['username','email',_0x2b9ad2(0xd8),_0x2b9ad2(0xde),_0x2b9ad2(0xc9)];exports['getListViewHandler']=function(_0x47949e,_0x5e95b4){var _0x3045cf=_0x2b9ad2;_0x5e95b4[_0x3045cf(0xe4)](_0x3045cf(0xce),{'me':userModule[_0x3045cf(0xca)](_0x47949e[_0x3045cf(0xd4)][_0x3045cf(0xdd)])});},exports[_0x2b9ad2(0xe2)]=function(_0x35fc3c,_0x486e1f,_0x431acc){var _0x30e5cb=_0x2b9ad2;userModule[_0x30e5cb(0xd2)](_0x35fc3c['user'],function(_0xc63f49){var _0x272090=_0x30e5cb;_0xc63f49?_0x431acc(_0xc63f49):_0x486e1f[_0x272090(0xe4)]('user_edit');});},exports['getHandler']=function(_0x31f179,_0x208a1b){var _0x39229d=_0x2b9ad2,_0x353767=userModule['getUsers'](),_0x89a5ed=_0x353767[_0x39229d(0xea)](function(_0x5cfbc6){return utils['filter'](_0x5cfbc6,FIELDS);});_0x208a1b[_0x39229d(0xd1)]({'data':_0x89a5ed});},exports['getItemHandler']=function(_0x21c691,_0x16b92e,_0x444808){var _0x59093b=_0x2b9ad2,_0x4f0add=_0x21c691[_0x59093b(0xe8)][_0x59093b(0xd5)];async['waterfall']([function(_0x50d5dc){var _0xed0032=_0x59093b;userModule[_0xed0032(0xd2)](_0x21c691[_0xed0032(0xd4)],_0x50d5dc);},function(_0x3446c7){checkUser(_0x4f0add,_0x3446c7);}],function(_0x335096,_0x85e918){var _0x48824a=_0x59093b;_0x335096?_0x444808(_0x335096):_0x16b92e[_0x48824a(0xd1)]({'data':utils[_0x48824a(0xee)](_0x85e918,FIELDS)});});},exports[_0x2b9ad2(0xec)]=function(_0x17bace,_0x37e7b6,_0x63a60a){var _0x59e53e=_0x2b9ad2,_0x209565,_0x20cd87,_0x1b6b94,_0xf30ce6=_0x17bace[_0x59e53e(0xe8)]['name'];async[_0x59e53e(0xc7)]([function(_0x5e495d){checkUser(_0xf30ce6,_0x5e495d);},function(_0x1e5aac,_0x4e96ac){var _0x1158b4=_0x59e53e;_0x20cd87=_0x1e5aac;var _0x37a490=_0x17bace['user'][_0x1158b4(0xdd)];_0x209565=userModule[_0x1158b4(0xca)](_0x37a490),_0x37a490!==_0x20cd87['username']&&!_0x209565[_0x1158b4(0xde)]?_0x4e96ac(errFactory[_0x1158b4(0xe0)]()):_0x4e96ac();},function(_0x371f5f){var _0x552d30=_0x59e53e;utils[_0x552d30(0xef)](_0x17bace,_0x371f5f);},function(_0x44f488,_0x1ebc5d){var _0x4bf264=_0x59e53e,_0x11fce7;_0x209565[_0x4bf264(0xde)]?_0x11fce7=['email',_0x4bf264(0xd8),_0x4bf264(0xde),'enabled']:_0x11fce7=[_0x4bf264(0xed),_0x4bf264(0xd8)],_0x1b6b94=_0x44f488[_0x4bf264(0xd3)],_0x44f488=utils[_0x4bf264(0xee)](_0x44f488,_0x11fce7),_0x20cd87=utils[_0x4bf264(0xdb)]({},_0x20cd87,_0x44f488),_0x1b6b94&&(_0x20cd87['password']=token[_0x4bf264(0xcd)](_0x1b6b94)),userModule[_0x4bf264(0xda)](_0xf30ce6,_0x20cd87,_0x1ebc5d);}],function(_0x2cb09c){var _0x3858fb=_0x59e53e;_0x2cb09c?_0x63a60a(_0x2cb09c):_0x37e7b6[_0x3858fb(0xd1)]({'data':'ok'});});},exports['deleteItemHandler']=function(_0x2f3474,_0x12098b,_0x568032){var _0x1299b9=_0x2b9ad2,_0xaa56c1=_0x2f3474[_0x1299b9(0xe8)]['name'];async['waterfall']([function(_0x47bcee){var _0xee937a=_0x1299b9;userModule['checkAdminPermission'](_0x2f3474[_0xee937a(0xd4)],_0x47bcee);},function(_0x401e20){var _0x64a28b=_0x1299b9;userModule[_0x64a28b(0xd9)](_0xaa56c1,_0x401e20);},function(_0x33bfe2){projectModule['removeManager'](_0xaa56c1,_0x33bfe2);}],function(_0x2c2206){var _0x2487b8=_0x1299b9;_0x2c2206?_0x568032(_0x2c2206):_0x12098b[_0x2487b8(0xd1)]({'data':'ok'});});};function checkUser(_0x360795,_0x483777){var _0x717f1c=_0x2b9ad2,_0x13e6a4=userModule[_0x717f1c(0xca)](_0x360795);_0x13e6a4?_0x483777(null,_0x13e6a4):_0x483777(errFactory[_0x717f1c(0xe7)]());}