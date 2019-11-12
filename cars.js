function createColorSelect() {
    t = "";
    t += '<option></option>';
    for (A in global.data.color.results) {
        t += '<option value="' + global.data.color.results[A].id + '">' + global.data.color.results[A].color + ' $' + global.data.color.results[A].cost + '.00</option>';
    }
    return t;
}

function createEngineSelect() {
    t = "";
    t += '<option></option>';
    for (A in global.data.engine.results) {
        t += '<option value="' + global.data.engine.results[A].id + '">' + global.data.engine.results[A].engine + ' $' + global.data.engine.results[A].cost + '.00</option>';
    }
    return t;
}

function createPackageCheckbox() {
    t = "";
    for (A in global.data.package.results) {
        t += '<label class="checkbox-inline"><input type="checkbox" value="' + global.data.package.results[A].id + '"id="package' + global.data.package.results[A].id + '">' + global.data.package.results[A].package + ' $' + global.data.package.results[A].cost + '.00 </label><br>'
    }
    return t;
}

function colorChange() {
    $("#color").off().on({
        "change": function() {
            currentColor = $("#color").val();

            if (currentColor === '') {
                alert('Color is required!');
            }
            priceChange();
        }
    });
}

function engineChange() {
    $("#engine").off().on({
        "change": function() {
            currentEngine = $("#engine").val();
            if (currentEngine === '') {
                alert('Engine is required!');
            } else {
                currentEngine = currentEngine * 1;
            }
            if (currentEngine === 1) {
                $('#package1').prop('disabled', true);
                $('#package1').prop('checked', false);
            } else {
                $('#package1').prop('disabled', false);
            }
            priceChange();
        }
    });
}

function package4() {
    $("#package4").off().on({
        "change": function() {

            if ($("#package4").is(':checked')) {
                $("#package3").prop("checked", true);
            } else {
                $("#package3").prop("checked", false);
            }
            priceChange();
        }
    });
}

function package1() {
    $("#package1").off().on({
        "change": function() {
            priceChange();
        }
    });
}

function package2() {
    $("#package2").off().on({
        "change": function() {
            priceChange();
        }
    });
}

function package3() {
    $("#package3").off().on({
        "change": function() {
            // this is poor logic consider revising
            if ($("#package3").is(':checked')) {} else {
                $("#package3").prop("checked", false);
                $("#package4").prop("checked", false);
            }
            priceChange();
        }
    });
}

function priceChange() {
    basePrice = 25600;
    colorCost = $("#color").val();
    engineCost = $("#engine").val();
    if (colorCost != '') {
        colorCost = global.data.color.results[colorCost - 1].cost * 1;
    } else {
        colorCost = 0;
    }
    if (engineCost != '') {
        engineCost = global.data.engine.results[engineCost - 1].cost * 1;
    } else {
        engineCost = 0;
    }
    if ($("#package1").is(':checked')) {
        package1 = $("#package1").val();
        package1 = global.data.package.results[package1 - 1].cost * 1;
    } else {
        package1 = 0;
    }
    if ($("#package2").is(':checked')) {
        package2 = $("#package2").val();
        package2 = global.data.package.results[package2 - 1].cost * 1;
    } else {
        package2 = 0;
    }
    if ($("#package3").is(':checked')) {
        package3 = $("#package3").val();
        package3 = global.data.package.results[package3 - 1].cost * 1;
    } else {
        package3 = 0;
    }
    if ($("#package4").is(':checked')) {
        package4 = $("#package4").val();
        package4 = global.data.package.results[package4 - 1].cost * 1;
    } else {
        package4 = 0;
    }
    totalCost = basePrice + colorCost + engineCost + package1 + package2 + package3 + package4;
    $("#totalCost").html(totalCost);
}

function beforeSubmit() {
    $("#insert").off().on({
        "click": function() {
            currentColor = $("#color").val();
            if (currentColor === '') {
                alert('Color is required!');
                return false;
            }
            currentEngine = $("#engine").val();
            if (currentEngine === '') {
                alert('Engine is required!');
                return false;
            }
            var allPackages = [];
            $('#packages :checked').each(function() {
                allPackages.push($(this).val());
            });

            submitForm({
                "color": currentColor,
                "engine": currentEngine,
                "package": allPackages
            });

        }
    });
}

function submitForm(json) {
    /***** BEGIN AJAX *****/
    try {
        /***** BEGIN ODATA URI *****/
        thisURI = "cars.cfc?method=insertCar&color=" + json.color + "&engine=" + json.engine + "&package=" + json.package;
        /***** END ODATA URI *****/

        jQuery.ajax({
            type: "GET",
            url: thisURI,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            cache: false,
            success: function(data, textStatus, jqXHR) {
                /***** BEGIN DATA PROCESS *****/
                global.data.sql = data;
                $("#sql").html(global.data.sql.results[0].Query);
                /***** END DATA PROCESS *****/
            },
            error: function(xhr, ajaxoptions, thrownError) {
                /***** BEGIN RECORD ERROR *****/
                console.log(thrownError);
                /***** END RECORD ERROR *****/
            }
        });
    } catch (e) {
        /***** BEGIN RECORD ERROR *****/
        console.log(e);
        /***** END RECORD ERROR *****/
    }
    /***** END AJAX *****/

}