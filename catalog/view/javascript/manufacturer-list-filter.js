$('body').on('change', '.manufacture-pick', function (){
    let thisValue = $(this).find('option:selected').data('key');
    $('.mfilter-manufacturer-list').find('input[name^="manufacturers"]').prop('checked', false);

    $('.mfilter-manufacturer-list').find('input[name="manufacturers"]').each(function (){
        if($(this).data('keys') == thisValue){
            $(this).prop('checked', true);

            if(parseInt(thisValue) == 263){ // Дисплей
                $('[data-keys="264"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 12){ // DVD
                $('[data-keys="13"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 136){ // Болт
                $('[data-keys="137"]').prop('checked', true);
                $('[data-keys="138"]').prop('checked', true);
                $('[data-keys="1347"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 177){ // Гидросфера
                $('[data-keys="178"]').prop('checked', true);
                $('[data-keys="179"]').prop('checked', true);
                $('[data-keys="180"]').prop('checked', true);
                $('[data-keys="181"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 183){ // Глушитель
                $('[data-keys="1256"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 256){ // Динамик
                $('[data-keys="1237"]').prop('checked', true);
                $('[data-keys="1519"]').prop('checked', true);
                $('[data-keys="1520"]').prop('checked', true);
                $('[data-keys="1521"]').prop('checked', true);
                $('[data-keys="1522"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 484){ // Кронштейн
                $('[data-keys="485"]').prop('checked', true);
                $('[data-keys="486"]').prop('checked', true);
                $('[data-keys="487"]').prop('checked', true);
                $('[data-keys="488"]').prop('checked', true);
                $('[data-keys="489"]').prop('checked', true);
                $('[data-keys="490"]').prop('checked', true);
                $('[data-keys="492"]').prop('checked', true);
                $('[data-keys="493"]').prop('checked', true);
                $('[data-keys="494"]').prop('checked', true);
                $('[data-keys="495"]').prop('checked', true);
                $('[data-keys="497"]').prop('checked', true);
                $('[data-keys="498"]').prop('checked', true);
                $('[data-keys="499"]').prop('checked', true);
                $('[data-keys="500"]').prop('checked', true);
                $('[data-keys="501"]').prop('checked', true);
                $('[data-keys="1432"]').prop('checked', true);
                $('[data-keys="1433"]').prop('checked', true);
                $('[data-keys="1434"]').prop('checked', true);
                $('[data-keys="1435"]').prop('checked', true);
                $('[data-keys="1436"]').prop('checked', true);
                $('[data-keys="1437"]').prop('checked', true);
                $('[data-keys="1438"]').prop('checked', true);
                $('[data-keys="1246"]').prop('checked', true);
                $('[data-keys="1248"]').prop('checked', true);
                $('[data-keys="1249"]').prop('checked', true);
                $('[data-keys="1250"]').prop('checked', true);
                $('[data-keys="1251"]').prop('checked', true);
                $('[data-keys="1252"]').prop('checked', true);
                $('[data-keys="1277"]').prop('checked', true);
                $('[data-keys="1332"]').prop('checked', true);
                $('[data-keys="1389"]').prop('checked', true);
                $('[data-keys="1397"]').prop('checked', true);
                $('[data-keys="1472"]').prop('checked', true);
                $('[data-keys="1473"]').prop('checked', true);
                $('[data-keys="1474"]').prop('checked', true);
                $('[data-keys="1475"]').prop('checked', true);
                $('[data-keys="1476"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 671){ // Натяжитель
                $('[data-keys="672"]').prop('checked', true);
                $('[data-keys="673"]').prop('checked', true);
                $('[data-keys="674"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 724){ // Педаль
                $('[data-keys="725"]').prop('checked', true);
                $('[data-keys="726"]').prop('checked', true);
                $('[data-keys="727"]').prop('checked', true);
                $('[data-keys="728"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 743){ // Петля двери
                $('[data-keys="1199"]').prop('checked', true);
                $('[data-keys="1203"]').prop('checked', true);
                $('[data-keys="1208"]').prop('checked', true);
                $('[data-keys="1215"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 744){ // Петля капота
                $('[data-keys="1185"]').prop('checked', true);
                $('[data-keys="1186"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 749){ // Пластик
                $('[data-keys="750"]').prop('checked', true);
                $('[data-keys="751"]').prop('checked', true);
                $('[data-keys="1284"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 756){ // Пневмоподушка
                $('[data-keys="757"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 768){ // Подножка
                $('[data-keys="1222"]').prop('checked', true);
                $('[data-keys="1289"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 778){ // Подушка безопасности
                $('[data-keys="779"]').prop('checked', true);
                $('[data-keys="780"]').prop('checked', true);
                $('[data-keys="781"]').prop('checked', true);
                $('[data-keys="782"]').prop('checked', true);
                $('[data-keys="783"]').prop('checked', true);
                $('[data-keys="784"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 789){ // Подшипник
                $('[data-keys="790"]').prop('checked', true);
                $('[data-keys="1285"]').prop('checked', true);
                $('[data-keys="1446"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 819){ // Проводка
                $('[data-keys="820"]').prop('checked', true);
                $('[data-keys="821"]').prop('checked', true);
                $('[data-keys="822"]').prop('checked', true);
                $('[data-keys="823"]').prop('checked', true);
                $('[data-keys="1229"]').prop('checked', true);
                $('[data-keys="1234"]').prop('checked', true);
                $('[data-keys="1515"]').prop('checked', true);
                $('[data-keys="1516"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 826){ // Прокладка
                $('[data-keys="1195"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 836){ // Пыльник
                $('[data-keys="1339"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 875){ // Ремень безопасности
                $('[data-keys="876"]').prop('checked', true);
                $('[data-keys="877"]').prop('checked', true);
                $('[data-keys="878"]').prop('checked', true);
                $('[data-keys="879"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 885){ // Рессора
                $('[data-keys="886"]').prop('checked', true);
                $('[data-keys="887"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 910){ // Ручка наружная задняя левая
                $('[data-keys="911"]').prop('checked', true);
                $('[data-keys="912"]').prop('checked', true);
                $('[data-keys="913"]').prop('checked', true);
                $('[data-keys="914"]').prop('checked', true);
                $('[data-keys="915"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 922){ // Рычаг задний
                $('[data-keys="923"]').prop('checked', true);
                $('[data-keys="924"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 925){ // Рычаг передний
                $('[data-keys="926"]').prop('checked', true);
                $('[data-keys="927"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 942){ // Сиденье переднее
                $('[data-keys="1219"]').prop('checked', true);
                $('[data-keys="1221"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 951){ // Скоба суппорта
                $('[data-keys="1268"]').prop('checked', true);
                $('[data-keys="1269"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 981){ // Стеклоподъемник
                $('[data-keys="982"]').prop('checked', true);
                $('[data-keys="983"]').prop('checked', true);
                $('[data-keys="984"]').prop('checked', true);
                $('[data-keys="985"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 986){ // Стеклоподъемник электрический
                $('[data-keys="987"]').prop('checked', true);
                $('[data-keys="988"]').prop('checked', true);
                $('[data-keys="989"]').prop('checked', true);
                $('[data-keys="990"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 1009){ // Суппорт
                $('[data-keys="1010"]').prop('checked', true);
                $('[data-keys="1011"]').prop('checked', true);
                $('[data-keys="1012"]').prop('checked', true);
                $('[data-keys="1013"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 1057){ // Тяга
                $('[data-keys="1058"]').prop('checked', true);
                $('[data-keys="1059"]').prop('checked', true);
                $('[data-keys="1060"]').prop('checked', true);
                $('[data-keys="1405"]').prop('checked', true);
                $('[data-keys="1393"]').prop('checked', true);
                $('[data-keys="1406"]').prop('checked', true);
                $('[data-keys="1407"]').prop('checked', true);
                $('[data-keys="1503"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 1062){ // Уплотнитель
                $('[data-keys="1230"]').prop('checked', true);
                $('[data-keys="1231"]').prop('checked', true);
                $('[data-keys="1232"]').prop('checked', true);
                $('[data-keys="1233"]').prop('checked', true);
                $('[data-keys="1261"]').prop('checked', true);
                $('[data-keys="1272"]').prop('checked', true);
                $('[data-keys="1309"]').prop('checked', true);
                $('[data-keys="1363"]').prop('checked', true);
                $('[data-keys="1455"]').prop('checked', true);
            }

            if(parseInt(thisValue) == 1126){ // Часть кузова (вырезанный элемент)
                $('[data-keys="1128"]').prop('checked', true);
                $('[data-keys="1129"]').prop('checked', true);
                $('[data-keys="1130"]').prop('checked', true);
                $('[data-keys="1131"]').prop('checked', true);
            }
        }
    });
});

$(document).ready(function() {
    if($('[data-keys="264"]').is(':checked') && $('[data-keys="263"]').is(':checked')){
        $('[data-key="263"]').prop('selected', true);
    }

    if($('[data-keys="12"]').is(':checked') && $('[data-keys="13"]').is(':checked')){
        $('[data-key="12"]').prop('selected', true);
    }

    if(
        $('[data-keys="136"]').is(':checked') &&
        $('[data-keys="137"]').is(':checked') &&
        $('[data-keys="138"]').is(':checked') &&
        $('[data-keys="1347"]').is(':checked')
    ){
        $('[data-key="136"]').prop('selected', true);
    }

    if(
        $('[data-keys="177"]').is(':checked') &&
        $('[data-keys="178"]').is(':checked') &&
        $('[data-keys="179"]').is(':checked') &&
        $('[data-keys="180"]').is(':checked') &&
        $('[data-keys="181"]').is(':checked')
    ){
        $('[data-key="177"]').prop('selected', true);
    }

    if(
        $('[data-keys="183"]').is(':checked') &&
        $('[data-keys="1256"]').is(':checked')
    ){
        $('[data-key="1256"]').prop('selected', true);
    }

    if(
        $('[data-keys="256"]').is(':checked') &&
        $('[data-keys="1237"]').is(':checked') &&
        $('[data-keys="1519"]').is(':checked') &&
        $('[data-keys="1520"]').is(':checked') &&
        $('[data-keys="1521"]').is(':checked') &&
        $('[data-keys="1522"]').is(':checked')
    ){
        $('[data-key="256"]').prop('selected', true);
    }

    if(
        $('[data-keys="484"]').is(':checked') &&
        $('[data-keys="485"]').is(':checked') &&
        $('[data-keys="486"]').is(':checked') &&
        $('[data-keys="487"]').is(':checked') &&
        $('[data-keys="488"]').is(':checked') &&
        $('[data-keys="489"]').is(':checked') &&
        $('[data-keys="490"]').is(':checked') &&
        $('[data-keys="492"]').is(':checked') &&
        $('[data-keys="493"]').is(':checked') &&
        $('[data-keys="494"]').is(':checked') &&
        $('[data-keys="495"]').is(':checked') &&
        $('[data-keys="497"]').is(':checked') &&
        $('[data-keys="498"]').is(':checked') &&
        $('[data-keys="499"]').is(':checked') &&
        $('[data-keys="500"]').is(':checked') &&
        $('[data-keys="501"]').is(':checked') &&
        $('[data-keys="1432"]').is(':checked') &&
        $('[data-keys="1433"]').is(':checked') &&
        $('[data-keys="1434"]').is(':checked') &&
        $('[data-keys="1435"]').is(':checked') &&
        $('[data-keys="1436"]').is(':checked') &&
        $('[data-keys="1437"]').is(':checked') &&
        $('[data-keys="1438"]').is(':checked') &&
        $('[data-keys="1246"]').is(':checked') &&
        $('[data-keys="1248"]').is(':checked') &&
        $('[data-keys="1249"]').is(':checked') &&
        $('[data-keys="1250"]').is(':checked') &&
        $('[data-keys="1251"]').is(':checked') &&
        $('[data-keys="1252"]').is(':checked') &&
        $('[data-keys="1277"]').is(':checked') &&
        $('[data-keys="1332"]').is(':checked') &&
        $('[data-keys="1389"]').is(':checked') &&
        $('[data-keys="1397"]').is(':checked') &&
        $('[data-keys="1472"]').is(':checked') &&
        $('[data-keys="1473"]').is(':checked') &&
        $('[data-keys="1474"]').is(':checked') &&
        $('[data-keys="1475"]').is(':checked') &&
        $('[data-keys="1476"]').is(':checked')
    ){
        $('[data-key="484"]').prop('selected', true);
    }

    if(
        $('[data-keys="671"]').is(':checked') &&
        $('[data-keys="672"]').is(':checked') &&
        $('[data-keys="673"]').is(':checked') &&
        $('[data-keys="674"]').is(':checked')
    ){
        $('[data-key="671"]').prop('selected', true);
    }

    if(
        $('[data-keys="724"]').is(':checked') &&
        $('[data-keys="725"]').is(':checked') &&
        $('[data-keys="726"]').is(':checked') &&
        $('[data-keys="727"]').is(':checked') &&
        $('[data-keys="728"]').is(':checked')
    ){
        $('[data-key="724"]').prop('selected', true);
    }

    if(
        $('[data-keys="743"]').is(':checked') &&
        $('[data-keys="1199"]').is(':checked') &&
        $('[data-keys="1203"]').is(':checked') &&
        $('[data-keys="1208"]').is(':checked') &&
        $('[data-keys="1215"]').is(':checked')
    ){
        $('[data-key="743"]').prop('selected', true);
    }

    if(
        $('[data-keys="744"]').is(':checked') &&
        $('[data-keys="1185"]').is(':checked') &&
        $('[data-keys="1186"]').is(':checked')
    ){
        $('[data-key="744"]').prop('selected', true);
    }

    if(
        $('[data-keys="749"]').is(':checked') &&
        $('[data-keys="750"]').is(':checked') &&
        $('[data-keys="751"]').is(':checked') &&
        $('[data-keys="1284"]').is(':checked')
    ){
        $('[data-key="749"]').prop('selected', true);
    }

    if(
        $('[data-keys="756"]').is(':checked') &&
        $('[data-keys="757"]').is(':checked')
    ){
        $('[data-key="756"]').prop('selected', true);
    }

    if(
        $('[data-keys="768"]').is(':checked') &&
        $('[data-keys="1222"]').is(':checked') &&
        $('[data-keys="1289"]').is(':checked')
    ){
        $('[data-key="768"]').prop('selected', true);
    }

    if(
        $('[data-keys="778"]').is(':checked') &&
        $('[data-keys="779"]').is(':checked') &&
        $('[data-keys="780"]').is(':checked') &&
        $('[data-keys="781"]').is(':checked') &&
        $('[data-keys="782"]').is(':checked') &&
        $('[data-keys="783"]').is(':checked') &&
        $('[data-keys="784"]').is(':checked')
    ){
        $('[data-key="778"]').prop('selected', true);
    }

    if(
        $('[data-keys="789"]').is(':checked') &&
        $('[data-keys="790"]').is(':checked') &&
        $('[data-keys="1285"]').is(':checked') &&
        $('[data-keys="1446"]').is(':checked')
    ){
        $('[data-key="789"]').prop('selected', true);
    }

    if(
        $('[data-keys="819"]').is(':checked') &&
        $('[data-keys="820"]').is(':checked') &&
        $('[data-keys="821"]').is(':checked') &&
        $('[data-keys="823"]').is(':checked') &&
        $('[data-keys="1229"]').is(':checked') &&
        $('[data-keys="1234"]').is(':checked') &&
        $('[data-keys="1515"]').is(':checked') &&
        $('[data-keys="1516"]').is(':checked') &&
        $('[data-keys="822"]').is(':checked')
    ){
        $('[data-key="819"]').prop('selected', true);
    }

    if(
        $('[data-keys="826"]').is(':checked') &&
        $('[data-keys="1195"]').is(':checked')
    ){
        $('[data-key="826"]').prop('selected', true);
    }

    if(
        $('[data-keys="836"]').is(':checked') &&
        $('[data-keys="1339"]').is(':checked')
    ){
        $('[data-key="836"]').prop('selected', true);
    }

    if(
        $('[data-keys="875"]').is(':checked') &&
        $('[data-keys="876"]').is(':checked') &&
        $('[data-keys="877"]').is(':checked') &&
        $('[data-keys="878"]').is(':checked') &&
        $('[data-keys="879"]').is(':checked')
    ){
        $('[data-key="875"]').prop('selected', true);
    }

    if(
        $('[data-keys="885"]').is(':checked') &&
        $('[data-keys="886"]').is(':checked') &&
        $('[data-keys="887"]').is(':checked')
    ){
        $('[data-key="885"]').prop('selected', true);
    }

    if(
        $('[data-keys="910"]').is(':checked') &&
        $('[data-keys="911"]').is(':checked') &&
        $('[data-keys="913"]').is(':checked') &&
        $('[data-keys="914"]').is(':checked') &&
        $('[data-keys="915"]').is(':checked') &&
        $('[data-keys="912"]').is(':checked')
    ){
        $('[data-key="910"]').prop('selected', true);
    }

    if(
        $('[data-keys="922"]').is(':checked') &&
        $('[data-keys="923"]').is(':checked') &&
        $('[data-keys="924"]').is(':checked')
    ){
        $('[data-key="922"]').prop('selected', true);
    }

    if(
        $('[data-keys="925"]').is(':checked') &&
        $('[data-keys="926"]').is(':checked') &&
        $('[data-keys="927"]').is(':checked')
    ){
        $('[data-key="925"]').prop('selected', true);
    }

    if(
        $('[data-keys="942"]').is(':checked') &&
        $('[data-keys="1219"]').is(':checked') &&
        $('[data-keys="1221"]').is(':checked')
    ){
        $('[data-key="942"]').prop('selected', true);
    }

    if(
        $('[data-keys="951"]').is(':checked') &&
        $('[data-keys="1268"]').is(':checked') &&
        $('[data-keys="1269"]').is(':checked')
    ){
        $('[data-key="951"]').prop('selected', true);
    }

    if(
        $('[data-keys="981"]').is(':checked') &&
        $('[data-keys="982"]').is(':checked') &&
        $('[data-keys="984"]').is(':checked') &&
        $('[data-keys="985"]').is(':checked') &&
        $('[data-keys="983"]').is(':checked')
    ){
        $('[data-key="981"]').prop('selected', true);
    }

    if(
        $('[data-keys="986"]').is(':checked') &&
        $('[data-keys="987"]').is(':checked') &&
        $('[data-keys="988"]').is(':checked') &&
        $('[data-keys="989"]').is(':checked') &&
        $('[data-keys="990"]').is(':checked')
    ){
        $('[data-key="986"]').prop('selected', true);
    }

    if(
        $('[data-keys="1009"]').is(':checked') &&
        $('[data-keys="1010"]').is(':checked') &&
        $('[data-keys="1011"]').is(':checked') &&
        $('[data-keys="1012"]').is(':checked') &&
        $('[data-keys="1013"]').is(':checked')
    ){
        $('[data-key="1009"]').prop('selected', true);
    }

    if(
        $('[data-keys="1057"]').is(':checked') &&
        $('[data-keys="1058"]').is(':checked') &&
        $('[data-keys="1059"]').is(':checked') &&
        $('[data-keys="1060"]').is(':checked') &&
        $('[data-keys="1393"]').is(':checked') &&
        $('[data-keys="1406"]').is(':checked') &&
        $('[data-keys="1407"]').is(':checked') &&
        $('[data-keys="1503"]').is(':checked') &&
        $('[data-keys="1405"]').is(':checked')
    ){
        $('[data-key="1057"]').prop('selected', true);
    }

    if(
        $('[data-keys="1062"]').is(':checked') &&
        $('[data-keys="1230"]').is(':checked') &&
        $('[data-keys="1231"]').is(':checked') &&
        $('[data-keys="1232"]').is(':checked') &&
        $('[data-keys="1233"]').is(':checked') &&
        $('[data-keys="1261"]').is(':checked') &&
        $('[data-keys="1272"]').is(':checked') &&
        $('[data-keys="1309"]').is(':checked') &&
        $('[data-keys="1363"]').is(':checked') &&
        $('[data-keys="1455"]').is(':checked')
    ){
        $('[data-key="1062"]').prop('selected', true);
    }

    if(
        $('[data-keys="1126"]').is(':checked') &&
        $('[data-keys="1128"]').is(':checked') &&
        $('[data-keys="1129"]').is(':checked') &&
        $('[data-keys="1130"]').is(':checked') &&
        $('[data-keys="1131"]').is(':checked')
    ){
        $('[data-key="1126"]').prop('selected', true);
    }


});
