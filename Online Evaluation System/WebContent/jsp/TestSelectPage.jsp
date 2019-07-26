<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <title>Course Selectio Page</title>
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
          <link rel="stylesheet" href="../assets/css/fontawesome.min.css">
            <!-- Material Kit CSS -->
            <link href="../assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet"/>
            <link rel="stylesheet" href="../css/CourseSelectPage.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            </head>
            <body>
              <div class="container-fluid">
                <div class="row R1">
                  <div class="col-sm-5 col-md-12 col-lg-12">
                    <div class="header-name">
                      <h6>Select a Test</h6>
                    </div><br><br>
                  </div>
                </div>

                <div class="row R2">
                  <div class="col-md-3">
                    <button class="btn btn-primary btn-block" type="button" name="button">Course name</button>
                  </div>
                </div>
                <div class="row R3">
                  <div class="container" style="overflow-y: scroll; height:250px;">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>Test No</th>
                          <th>Test Name</th>
                          <th>Register</th>
                          <th>Start Test</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>1.</td>
                          <td>Objective</td>
                          <td><a href="#">Register for Objective</a></td>
                          <td>
                            <div class="col-md-5 ">
                              <a href="#" id="1" onclick="displayRulesPage(this.id)"><button class="btn btn-primary " type="button" name="button">Go to Test</button></a>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>2.</td>
                          <td>Coding</td>
                          <td><a href="#">Register for Coding</a></td>
                          <td>
                            <div class="col-md-5 ">
                              <a href="RulesPage.jsp"><button class="btn btn-primary" type="button" name="button">Go to Test</button></a>              </div>
                            </td>
                          </tr>
                          <tr>
                            <td>3.</td>
                            <td>Descriptive</td>
                            <td><a href="#">Register for Descriptive</a></td>
                            <td>
                              <div class="col-md-5 ">
                                <a href="RulesPage.jsp"><button class="btn btn-primary" type="button" name="button">Go to Test</button></a>
                              </div>
                            </td>
                          </tr>
                           <tr>
                            <td>3.</td>
                            <td>Descriptive</td>
                            <td><a href="#">Register for Descriptive</a></td>
                            <td>
                              <div class="col-md-5 ">
                                <a href="RulesPage.jsp"><button class="btn btn-primary" type="button" name="button">Go to Test</button></a>
                              </div>
                            </td>
                          </tr>
                           <tr>
                            <td>3.</td>
                            <td>Descriptive</td>
                            <td><a href="#">Register for Descriptive</a></td>
                            <td>
                              <div class="col-md-5 ">
                                <a href="RulesPage.jsp"><button class="btn btn-primary" type="button" name="button">Go to Test</button></a>
                              </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <script>
               // $(document).ready(function(){
                	var searchString = window.location.search.substring(1);
        			var arr = searchString.split('&');
        			var data= arr[0].split('=')[1];
        			var testList = decodeURIComponent(data);
        		
        			//Start- Extract Tests List
        			var tests = testList.substring(0, testList.indexOf(']')+1);
        			var testsList = eval('(' + tests + ')');
        		
        			for(i=0; i<testsList.length; i++){
        				alert(testsList[i].evaluationTypeName + ":" + testsList[i].testFees)
        			} 
        			//End- Extract Tests List
              //  });
               
               function displayRulesPage(clicked_id){
            	   alert("displayTestSelect Id = " + clicked_id);
				   var testDetailId = 1;
				   var myData = {
			           testDetailId: testDetailId
			       };
					 
					$.ajax({
			            type: 'POST',
			            url: '/OnlineEvaluationSystem/CommonController?action=RulesServlet',
			            data: JSON.stringify(myData),
			            dataType: 'json',
			            contentType: 'application/json; charset=utf-8',
			            traditional: true,
			            success: function (jsonObj) {
			            	
			            	var responseJson1 = jsonObj[0]; 
			            	var locationJson = eval('(' + responseJson1 + ')');
			            	
			            	var responseJson2=jsonObj[1];
			               	var strResJSON = JSON.stringify(responseJson2);
			            	for(i=0; i<responseJson2.length; i++){
			            		alert("Rules : " + responseJson2[i].rulesId + "," + responseJson2[i].rulesDescription);
			               	}  
			               	//window.location.href = locationJson.location;
			            	window.location.href = locationJson.location + "?varid=" + encodeURIComponent(strResJSON) + "&username=" + "Anjali" +"&password=" + "Anjali";
		            	},
		            	error: function(){
		            	//alert("Error");
		            		document.getElementById("error").innerHTML = "Invalid email or password";
		            	}
		

		          });
               }
        		</script>
              </body>
            </html>
