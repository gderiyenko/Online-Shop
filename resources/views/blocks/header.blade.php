

<body class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo">
    <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="/list">
                        <img src="https://cdn.dribbble.com/users/64815/screenshots/1518220/attachments/229248/shop_logo_big.png" 
                        style= "width: 150px; height: 80px; margin: 0;"alt="logo" class="logo-default" /> </a>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN PAGE ACTIONS -->
                <!-- DOC: Remove "hide" class to enable the page header actions -->
                <div id="admin-panel" class="page-actions">
                    
                </div>
                <!-- END PAGE ACTIONS -->
                <!-- BEGIN PAGE TOP -->
                <div class="page-top">
                    <!-- BEGIN HEADER SEARCH BOX -->
                    <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
                    <form class="search-form" action="/list-find" method="GET">
                        <div class="input-group">
                            <input type="text" class="form-control input-sm" placeholder="Search..." name="findQuery">
                            <span class="input-group-btn">
                                <a href="javascript:;" class="btn submit">
                                    <i class="icon-magnifier"></i>
                                </a>
                            </span>
                        </div>
                    </form>
                    <!-- END HEADER SEARCH BOX -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <li class="separator hide"> </li>
                            <li class="separator hide"> </li>
                            <!-- BEGIN INBOX DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-extended dropdown-inbox dropdown-dark" id="header_inbox_bar">
                                <a href="/basket" class="dropdown-toggle">
                                    <i class="icon-basket"></i>
                                    <span class="badge badge-primary">Basket</span>
                                </a>
                            </li>
                            <!-- END INBOX DROPDOWN -->
                            <li class="separator hide"> </li>
                            <!-- BEGIN TODO DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            <li class="dropdown dropdown-extended dropdown-tasks dropdown-dark" id="header_task_bar">
                                <a href="/orders" class="dropdown-toggle">
                                    <i class="flaticon-folder-1"></i>
                                    <span class="badge badge-primary">Orders</span>
                                </a>
                            </li>
                            <!-- END TODO DROPDOWN -->
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                            @if (Auth::guest())

                            <li class="dropdown dropdown-extended dropdown-tasks dropdown-dark"><a class="dropdown-toggle" href="{{ url('/login') }}">
                                    <span class="badge badge-success">Login<span>
                                </a>
                            </li>
                            <li class="dropdown dropdown-extended dropdown-tasks dropdown-dark"><a class="dropdown-toggle" href="{{ url('/register') }}">
                                    <span class="badge badge-success">Register<span>
                                </a>
                            </li>
                            @else
                            <li class="dropdown dropdown-user dropdown-dark">
                                <a onclick="getMessage()" href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <span class="username username-hide-on-mobile"> @php if (isset(Auth::user()->name)) echo Auth::user()->name; @endphp </span>
                                    <!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
                                    <img alt="" class="img-circle" src="../assets/layouts/layout4/img/avatar9.jpg" /> </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <li>
                                        <a href="{{ url('/logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            <i class="icon-key"></i> Log Out </a>
                                            <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                                {{ csrf_field() }}
                                            </form>
                                    </li>
                                </ul>
                            </li>
                            @endif
                            <!-- END USER LOGIN DROPDOWN -->
                        </ul>
                    </div>
                    <!-- END TOP NAVIGATION MENU -->
                </div>
                <!-- END PAGE TOP -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->

 <script>
    function getXMLHTTP() {
           var x = false;
           try {
              x = new XMLHttpRequest();
           }catch(e) {
             try {
                x = new ActiveXObject("Microsoft.XMLHTTP");
             }catch(ex) {
                try {
                    req = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1) {
                    x = false;
                }
             }
          }
          return x;
        }
 function getMessage(){ console.log(1);

     var req = getXMLHTTP();
      
      if (req) {
       req.onreadystatechange = function() {
        if (req.readyState == 4) {
         // only if "OK"
         if (req.status == 200) {      
          document.getElementById('admin-panel').innerHTML=req.responseText;      
         } else {
          alert("Problem while using XMLHTTP:\n" + req.statusText);
         }
        }    
       }   
       req.open("GET", "/check-admin", true);
       req.send(null);
      }
 }
 </script>