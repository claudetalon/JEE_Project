<html>
	<head>
		<title>Google Visualization API plugin</title>
		<meta name="layout" content="main" />
		<gvisualization:apiImport />
	</head>
	<body>
		<%
			def myDailyActivitiesColumns = [['string', 'Answer'], ['number', 'Percentage']]
			def myDailyActivitiesData = [['Work', 11], ['Eat', 2], ['Commute', 2], ['Watch TV', 2], ['Sleep', 7]]
			print("${questionInstance.list}")
		 %>
	
		<gvisualization:pieCoreChart elementId="piechart"
			title="Results" width="${450}" height="${300}"
			columns="${myDailyActivitiesColumns}" data="${myDailyActivitiesData}" />
		<div id="piechart"></div>
	</body>
</html>