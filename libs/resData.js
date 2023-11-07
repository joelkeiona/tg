exports.resultDatas = function (data, status,desc) {
    var datas = {}
    datas.code = status || 200;
    datas.desc = desc || '';
    datas.data = data || '';
    let json =  JSON.parse(JSON.stringify(datas));

    return json;
};

exports.resultF = function (status,desc) {
    var datas = {}
    datas.code = status || -1;
    datas.desc = desc || '';
    let json =  JSON.parse(JSON.stringify(datas));

    return json;
};

exports.resultSuccess = function (status,desc) {
    var datas = {}
    datas.code = status || 200;
    datas.desc = desc || '';
    let json =  JSON.parse(JSON.stringify(datas));

    return json;
};
