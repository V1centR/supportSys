<jsp:include page="header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>"></script>
<script src="<c:url value="/resources/js/addhelpAction.js"/>"></script>
<script>
$(document).ready(function () {
	
    $('form.addhelpForm')[0].reset();
    $('button#back').click(function(){        
        window.location.href = '/supportSys';
    });
    
    $('#send').click(function () {       
        var formMode = 		$("input#formMode").val();
        var client = 		$("input#client").val();
        var idAtividade = 	$("input#idAtividade").val();
        var helpLabel = 	$("input#helpLabel").val();
        var category = 		$("select#cat").val();
        var dept = 			$("select#dept").val();
        var description = 	$("textarea#desc").val();
        var email = "imprensa@asspm.org.br";
//        var helpLabel = $('input[name="situacao"]:checked').val();
        
//        if(helpLabel == '' || description == '' || category == 0 || department_id == 0){                
//            $('span.message-danger').append('<div class="alert alert-danger" role="alert"><strong>ATEN��O!</strong> Todos os campos s�o obrigat�rios!</div>');
//            return false;
//        }
        
	    $("button.btn-send").attr("disabled","disabled");
	    $('span.loader').append('<img src="../resources/images/loader.gif">');
      
      var strFormJson = "{\"formMode\":\"" + formMode + "\",\"client\":\""+ client + "\",\"idAtividade\":\""+ idAtividade + "\",\"helpLabel\":\""+ helpLabel + "\",\"category\":\""+ category + "\",\"dept\":\""+ dept + "\",\"description\":\""+ description + "\"}";  
      
      var setJson = JSON.stringify(strFormJson);
      $("form.addhelpForm :input").attr("disabled", true);
        $.ajax({        	
            type: 'POST',
            dataType: 'json',
            url: '../addhelp',
            data: setJson,
            contentType : 'application/json; charset=utf-8',
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            success: function (data) {
               console.log(data);
               
               $('span.loader').remove();
               $('span.message-danger').remove();
               $("form.addhelpForm").fadeOut('fast');
               
               if(data == 201){
            	   $('span.message').append('<div class="alert alert-success" role="alert">Atividade registrada com sucesso! <a href="/">(Clique para voltar)</a></div>');
               }
               
               if(data == 500){
            	   $('span.message').append('<div class="alert alert-danger" role="alert">Houve um erro de procesamento, seu chamado n�o foi registrado! <a href="/">(Clique para voltar)</a></div>');
               }
              
               return true;
            },
            error: function (data) {
                console.log(data);
                return false;
            }
        });
    });
    // --final documentReady --
});
</script>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Support</b>Sys</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="<c:url value="/resources/images/user20171003.jpg"/>" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<c:url value="/resources/images/user20171003.jpg"/>" class="user-image" alt="User Image">
              <span class="hidden-xs">Vicente Ramos</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <jsp:include page="sidemenu.jsp" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    

    <!-- Main content -->
    <section class="content">
      
      <section class="content-header">
      <h1>
        Intranet
        <small>Novo chamado</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Intranet</li>
      </ol>
    </section>
      <div class="row">
      
        <!--CONTENT ##################### Left col -->
        <section class="col-lg-7 connectedSortable">
      		<div style="margin-top: 20px;"></div>
			<span class="message-danger"></span>
			<span class="message"></span>
			
			
			
			<form name="addHelp" class="addhelpForm" method="post">
                <input type="hidden" id="formMode" name="formMode" value="add">
                <input type="hidden" id="client" name="client" value="1">
                <input type="hidden" id="idAtividade" name="idAtividade" value="0">
                <table class="table" border="0">
                    <tbody>
                        <tr>
                            <td colspan="2">                                
                                <label>*T�tulo</label>                                
                                <input type="text" name="helpLabel" id="helpLabel" value="Miguel AAA" class="form-control" style="font-size: 14px; font-weight: bold; width: 500px;">                               
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                        	<td>
								<div style="position: relative; float: left; margin-right: 12px;">                                    
                                    <label>*Categoria</label>
                                    <select name="cat" id="cat" class="form-control" style="width:250px;">
	                                    <option value="0">...</option>
	                                    <option value="1" selected="selected">Backup</option>
	                                    <option value="2">E-mail</option>
	                                    <option value="3">Hardware</option>
	                                    <option value="4">Impressora/Scanner</option>
	                                    <option value="5">Internet*</option>
	                                    <option value="6">Rede</option>
	                                    <option value="7">S.O</option>
	                                    <option value="8">Sistema</option>
	                                    <option value="9">Site</option>
	                                    <option value="10">Software</option>
	                                    <option value="11">Particular</option>
                                    </select>
                                </div>
							</td>
							<td>
								<div style="position: relative; float: left; margin-right: 12px;">                                    
                                    <label>*Setor</label>
                                    <select name="dept" id="dept" class="form-control" style="max-width:250px;">
	        							<option value="0" selected="selected">...</option>
	        							<option value="1">T.I</option>
	        							<option value="1" selected="selected">Assist Social Assist</option>
	        							<option value="1">Col�nia</option>
	        							<option value="1">Cons Deliberativo</option>
	        							<option value="1">Cons Fiscal</option>
	        							<option value="1">Despachante</option>
	        							<option value="1">Ensino</option>
	        							<option value="1">Jur�dico</option>
	        							<option value="1">Patrim�nio</option>
	        							<option value="1">Pensionistas</option>
	        							<option value="1">Portaria</option>
	        							<option value="1">Rela��es P�blicas</option>
	        							<option value="1">Sal�o de eventos</option>
	        							<option value="1">Secretaria</option>
	        							<option value="1">Tesouraria</option>
	        							<option value="1">Presid�ncia</option>
	        							<option value="1">Vice Presid�ncia</option>
        							</select>
                                </div>
							</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <label>*Descri��o</label><br>
                                <textarea class="form-control" name="desc" id="desc" maxlength="600" style="width: 600px; height: 150px; font-size: 12px; padding: 8px;">Teste texto descri��o</textarea>
                            </td>
                        </tr>
                        <tr>
                           <td colspan="2" style="text-align:right">
                               <button id="back" type="button" name="btn" class="btn btn-primary btn-lg btn-voltar"><span class="glyphicon glyphicon-chevron-left"></span> Voltar</button>
                               <button id="send" type="button" name="btn" class="btn btn-primary btn-lg btn-send"><span class="glyphicon glyphicon-fire"></span> Enviar</button>                                
                               <span class="loader"></span>
                           </td>
                        </tr>
                    </tbody>
                </table>
            </form>
			


          

        </section>
        <!-- /.Left col -->
        
        
        
        
        
        
        
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        <section class="col-lg-5 connectedSortable">
        <!-- Calendar -->
          <div class="box box-solid bg-green-gradient">
            <div class="box-header">
              <i class="fa fa-calendar"></i>

              <h3 class="box-title">Calendar</h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <!-- button with a dropdown -->
                <div class="btn-group">
                  <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-bars"></i></button>
                  <ul class="dropdown-menu pull-right" role="menu">
                    <li><a href="#">Add new event</a></li>
                    <li><a href="#">Clear events</a></li>
                    <li class="divider"></li>
                    <li><a href="#">View calendar</a></li>
                  </ul>
                </div>
                <button type="button" class="btn btn-success btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-success btn-sm" data-widget="remove"><i class="fa fa-times"></i>
                </button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <!--The calendar -->
              <div id="calendar" style="width: 100%"></div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-black">
              <div class="row">
                <div class="col-sm-6">
                  <!-- Progress bars -->
                  <div class="clearfix">
                    <span class="pull-left">Task #1</span>
                    <small class="pull-right">90%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 90%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #2</span>
                    <small class="pull-right">70%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 70%;"></div>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                  <div class="clearfix">
                    <span class="pull-left">Task #3</span>
                    <small class="pull-right">60%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 60%;"></div>
                  </div>

                  <div class="clearfix">
                    <span class="pull-left">Task #4</span>
                    <small class="pull-right">40%</small>
                  </div>
                  <div class="progress xs">
                    <div class="progress-bar progress-bar-green" style="width: 40%;"></div>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->

        </section>
        <!-- right col -->
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <jsp:include page="footer.jsp" />
