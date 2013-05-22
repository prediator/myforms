
<style type="text/css">
        body {
            font-family: Arial, "Free Sans";
            margin: 0;
            padding: 0;
        }
        #main {
            background: #0099cc;
            margin-top: 0;
            padding: 2px 0 4px 0;
            text-align: center;
        }
        #main a {
            color: #ffffff;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            font-family: Arial;
        }
        #main a:hover {
            text-decoration: underline;
        }
        #item_container {
            width: 300px;
            height: 800px;
border-width : 5px;
border-color: gray;
border-style: solid;
        }
        .item {
            background: #fff;
            float: left;
            padding: 5px;
            margin: 5px;
            cursor: move;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.5);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.5);
            box-shadow: 0 1px 2px rgba(0,0,0,.5);
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            z-index: 5;
        }
        .title, .price {
            display: block;
            text-align: center;
            font-size: 11px;
            letter-spacing: -1px;
            font-weight: bold;
            cursor: move;
            text-align: left;
        }
        .title {
            color: #333;
        }
        .price {
            color: #0099cc;
            margin-top: 5px;
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
        }
        .icart, .icart label {
            cursor: pointer;
            height: 120px;
            width: 90%;
        }
        .icart input, .icart select{
        width: 150%;
        }
        .divrm {
            text-align: right;
            width: 100%;
        }
        .remove {
            text-decoration: none;
            cursor: pointer;
            font-weight: bold;
            font-size: 20px;
            position: relative;
            top: -7px;
        }
        .remove:hover {
            color: #999;
        }
        .clear {
            clear: both;
        }
        .fldset{
        font-size: 10px;
        cursor: pointer;
        margin-right: 4px;
    	vertical-align: top;
        }
        #cart_container {
            width: 100%;
            height: 100%;
        }
        #cart_title span {
            border: 8px solid #666;
            border-bottom-width: 0;
            background: #333;
            display: block;
            float: left;
            color: #fff;
            font-size: 11px;
            font-weight: bold;
            padding: 5px 10px;
            -webkit-border-radius: .5em .5em 0 0;
            -moz-border-radius: .5em .5em 0 0;
            border-radius: .5em .5em 0 0;
        }
        #cart_toolbar {
            overflow: hidden;
            border: 8px solid #666;
            height: 800px;
            z-index: -2;
            width: 100%;
            -webkit-border-radius: 0 .5em 0 0;
            -moz-border-radius: 0 .5em 0 0;
            border-radius: 0 .5em 0 0;
            background: #ffffff;
        }
        #cart_items {
            height: 100%;
            width: 100%;
            position: relative;
            padding: 0 0 0 2px;
            z-index: 0;
            cursor: e-resize;
            border-width: 0 2px;
        }
        .back {
            background: #e9e9e9;
        }
        #cart_items tr td {
            width: 33%;
            position: relative;
            padding: 0 0 0 2px;
            z-index: 0;
            cursor: e-resize;
            border-width: 0 2px;
        }
        #navigate {
            width: 463px;
            margin: 0 auto;
            border: 8px solid #666;
            border-top-width: 0;
            -webkit-border-radius: 0 0 .5em .5em;
            -moz-border-radius: 0 0 .5em .5em;
            border-radius: 0 0 .5em .5em;
            padding: 10px;
            font-size: 14px;
            background: #333;
            font-weight: bold;
        }
        #nav_left {
            float: left;
            cursor: pointer;
        }

        #nav_left a {
            padding: 4px 8px;
            background: #fff;
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            text-decoration: none;
            color:#0099cc;
        }
        #nav_left a:hover {
            background: #666;
            color: #fff;
        }
        #nav_left_ts {
            float: left;
            cursor: pointer;
        }

        #nav_left_ts a {
            padding: 4px 8px;
            background: #fff;
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            text-decoration: none;
            color:#0099cc;
        }
        #nav_left_ts a:hover {
            background: #666;
            color: #fff;
        }
        #nav_right {
            float: right;
            background-color: white;
        }
        .sptext {
            background: #ffffff;
            padding: 4px 8px;
            margin-left: 8px;            
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            color: #666;
        }
        .count {
            color: #0099cc;
        }
        .drop-active {
            background: #ffff99;
        }
        .drop-hover {
            background: #ffff66;
        }
    </style>
    <script type="text/javascript">
    var total_items = 0;
    var total_price = 0;
    $(document).ready(function() {

        $(".item").draggable({
            revert: true            
        });
        $("#cart_items").draggable({
            axis: "y"
        });

        $("#cart_items").droppable({
            accept: ".item",
            activeClass: "drop-active",
            hoverClass: "drop-hover",
            drop: function(event, ui) {
                var item = ui.draggable.html();
                var itemid = ui.draggable.attr("id");
                var html = '<div class="item icart">';
                html = html + '<div class="divrm">';
                html = html + '<a onclick="editSettings(this ,'+ total_items+')" class="fldset">Settings</a>';
                html = html + '<a onclick="remove(this)" class="remove '+itemid+'">&times;</a>';
                html = html + '<div/>'+item+'</div>';
                

                // update total items
                
                if(total_items%3 == 0){
                   var tr = '<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>';
                   $("#cart_items").append(tr);
                }
                var tdIndex = total_items%3;
                //alert(tdIndex)
                var td = $('#cart_items tr:last').children()[tdIndex].innerHTML  = html;
                
                total_items++;
                $("#citem").html(total_items);

                // update total price
                //var price = parseInt(ui.draggable.find(".price").html().replace("$ ", ""));
                //total_price = total_price + price;
               // $("#cprice").html("$ " + total_price);

                // expand cart items
                if (total_items > 4) {
                  //  $("#cart_items").animate({width: "+=120"}, 'slow');
                }
            }
            
        });
       

        $("#btn_next").click(function() {
            $("#cart_items").animate({top: "-=100"}, 100);
            return false;
        });
        $("#btn_prev").click(function() {
            $("#cart_items").animate({top: "+=100"}, 100);
            return false;
        });
        $("#btn_clear").click(function() {
            $("#cart_items").fadeOut("2000", function() {
               $(this).html("").fadeIn("fast").css({left: 0});
            });
            $("#citem").html("0");
            $("#cprice").html("$ 0");
            total_items = 0;
            total_price = 0;
            return false;
        });
        $("#nav_left").click(function() {
            $("#fldtray").css('display','block');
            $("#tmplate_settings").css('display','none');
            return false;
        });
       	$("#nav_left_ts").click(function() {
            $("#fldtray").css('display','none');
            $("#tmplate_settings").css('display','block');
            
            return false;
        });
        $('#tname').keyup(function() {
 			 $('#templ_title').html(this.value);
 			 return false;
		});
		$('.fldset').click(function(){
		$( "#edit-fld-seetings" ).dialog({
			height: 600,
			width:400,
			modal: true
		});
		});
        
    });
    function remove(el) {
        $(el).hide();
        $(el).parent().parent().effect("highlight", {color: "#ff0000"}, 1000);
        $(el).parent().parent().fadeOut('1000');
        setTimeout(function() {
            $(el).parent().parent().remove();
            // collapse cart items
            if (total_items > 3) {
                //$("#cart_items").animate({width: "-=120"}, 'slow');
            }
        }, 1100);

        // update total item
        total_items--;
        $("#citem").html(total_items);

        // update totl price
        //var price = parseInt($(el).parent().parent().find(".price").html().replace("$ ", ""));
        //total_price = total_price - price;
        //$("#cprice").html("$ " + total_price);
    }
    </script>