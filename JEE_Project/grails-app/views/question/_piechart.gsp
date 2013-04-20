<html>
	<head>
		<title>Google Visualization API plugin</title>
		<meta name="layout" content="main" />
		<gvisualization:apiImport />
	</head>
	<body>
		<%
			def myDailyActivitiesColumns = [['string', 'Answer'], ['number', 'Percentage']]
			def myDailyActivitiesData = ${questionInstance.list}
			//print(${questionInstance.list})
		 %>
	
		<gvisualization:pieCoreChart elementId="piechart"
			title="Results" width="${450}" height="${300}"
			columns="${myDailyActivitiesColumns}" data="${myDailyActivitiesData}" />
		<div id="piechart"></div>
	</body>
</html>