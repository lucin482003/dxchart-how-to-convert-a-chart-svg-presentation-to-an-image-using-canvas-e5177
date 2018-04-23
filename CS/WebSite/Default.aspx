<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to convert a SVG chart to an image</title>
    <script src="js/jquery-2.0.3.min.js"></script>
    <script src="js/globalize.min.js"></script>
    <script src="js/dx.chartjs.js"></script>

    <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/rgbcolor.js"></script>
    <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/StackBlur.js"></script>
    <script type="text/javascript" src="http://canvg.googlecode.com/svn/trunk/canvg.js"></script>

    <script type="text/javascript">
        $(function () {
            $("#chartContainer").dxChart({
                dataSource: [
                    { day: "Monday", oranges: 3 },
                    { day: "Tuesday", oranges: 2 },
                    { day: "Wednesday", oranges: 3 },
                    { day: "Thursday", oranges: 4 },
                    { day: "Friday", oranges: 6 },
                    { day: "Saturday", oranges: 11 },
                    { day: "Sunday", oranges: 4 }],

                series: {
                    argumentField: "day",
                    valueField: "oranges",
                    name: "My oranges",
                    type: "bar",
                    color: '#ffa500'
                }
            });
        });

        function onClick() {
            var chart = $('#chartContainer').dxChart('instance');
            var svg = chart.svg();

            var canvas = document.getElementById("canvas");
            canvg(canvas, svg);

            var img = canvas.toDataURL("image/png");
            document.getElementById("img").src = img;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="button" value="export chart" onclick="onClick()" />
        <div id="chartContainer" style="max-width: 800px; height: 400px;"></div>
        <img id="img" alt="" />
        <canvas id="canvas" style="visibility: hidden"></canvas>
    </form>
</body>
</html>
