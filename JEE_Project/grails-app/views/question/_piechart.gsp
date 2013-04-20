<html>
	<head>
		<title>Google Visualization API plugin</title>
		<meta name="layout" content="main" />
		<gvisualization:apiImport />
	</head>
	<body>
		<%
			def myDailyActivitiesColumns = [['string', 'Answer'], ['number', 'Percentage']]
		 %>
	
		<gvisualization:pieCoreChart elementId="piechart"
			title="Results" width="${450}" height="${300}"
			columns="${myDailyActivitiesColumns}" data="${questionInstance.list}" />
		<div id="piechart"></div>
	</body>
</html>