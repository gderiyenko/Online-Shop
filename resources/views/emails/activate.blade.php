<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">

<head>
	<style>
	a:hover {
		text-decoration: underline !important;
	}
	td.promocell p { 
		color:#e1d8c1;
		font-size:16px;
		line-height:26px;
		font-family:sans-serif;
		margin-top:0;
		margin-bottom:0;
		padding-top:0;
		padding-bottom:14px;
		font-weight:normal;
	}
	td.contentblock h4 {
		color:#444444 !important;
		font-size:16px;
		line-height:24px;
		font-family:sans-serif;
		margin-top:0;
		margin-bottom:10px;
		padding-top:0;
		padding-bottom:0;
		font-weight:normal;
	}
	td.contentblock h4 a {
		color:#444444;
		text-decoration:none;
	}
	td.contentblock p { 
	  	color:#888888;
		font-size:13px;
		line-height:19px;
		font-family:sans-serif;
		margin-top:0;
		margin-bottom:12px;
		padding-top:0;
		padding-bottom:0;
		font-weight:normal;
	}
	td.contentblock p a { 
	  	background: #F0FFFF;
		text-decoration:none;
	}
	@media only screen and (max-device-width: 480px) {
	     div[class="header"] {
	          font-size: 16px !important;
	     }
	     table[class="table"], td[class="cell"] {
	          width: 300px !important;
	     }
		table[class="promotable"], td[class="promocell"] {
	          width: 325px !important;
	     }
		td[class="footershow"] {
	          width: 300px !important;
	     }
		table[class="hide"], img[class="hide"], td[class="hide"] {
	          display: none !important;
	     }
	     img[class="divider"] {
		      height: 1px !important;
		 }
		 td[class="logocell"] {
			padding-top: 15px !important; 
			padding-left: 15px !important;
			width: 300px !important;
		 }
	     img[id="screenshot"] {
	          width: 325px !important;
	          height: 127px !important;
	     }
		img[class="galleryimage"] {
			  width: 53px !important;
	          height: 53px !important;
		}
		p[class="reminder"] {
			font-size: 11px !important;
		}
		h1 {
			color:#3ca7dd;
			line-height: 26px !important;
			margin-bottom: 15px !important;
			font-size: 24px !important;
		}
		h4[class="secondary"] {
			line-height: 22px !important;
			margin-bottom: 15px !important;
			font-size: 18px !important;
		}
	}
	</style>
</head>
<body bgcolor="#e4e4e4" topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="-webkit-font-smoothing: antialiased;width:100% !important;background:#e4e4e4;-webkit-text-size-adjust:none;">
	
<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="#e4e4e4">
<tr>
	<td bgcolor="#e4e4e4" width="100%">

	<table width="600" cellpadding="0" cellspacing="0" border="0" align="center" class="table">
	<tr>

		<table width="600" cellpadding="25" cellspacing="0" border="0" class="promotable">
		<tr>
			<td bgcolor="#456265" width="600" class="promocell">                      
			 
				<multiline label="Main feature intro"><h1>Antishop's massage</h1></multiline>
			
			</td>
		</tr>
		</table>
	
		<img border="0" src="images/spacer.gif" width="1" height="15" class="divider"><br>
	
		<repeater>
			<layout label="New feature">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td bgcolor="#85bdad" nowrap><img border="0" src="images/spacer.gif" width="5" height="1"></td>
				<td width="100%" bgcolor="#ffffff">
			
					<table width="100%" cellpadding="20" cellspacing="0" border="0">
					<tr>
						<td bgcolor="#ffffff" class="contentblock">

							<h4 class="secondary"><strong><singleline label="Title">Welcome to our shop! </singleline></strong></h4>
							<multiline label="Description"><p>We've got order to your registration at {{$take_time}} .</p></multiline>
							<multiline label="Description"><p>For activating account go to: @php echo $link; @endphp .</p></multiline>
						</td>
					</tr>
					</table>
			
				</td>
			</tr>
			</table>  
			<img border="0" src="images/spacer.gif" width="1" height="15" class="divider"><br>
			</layout>
			<layout label="Article, tip or resource">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td bgcolor="#ef3101" nowrap><img border="0" src="images/spacer.gif" width="5" height="1"></td>
				<td width="100%" bgcolor="#ffffff">
			
					<table width="100%" cellpadding="20" cellspacing="0" border="0">
					<tr>
						<td bgcolor="#ffffff" class="contentblock">

							<h4 class="secondary"><strong><singleline label="Title">We waiting for you comming</singleline></strong></h4>
							<multiline label="Description"><p>Something for you: </p></multiline>

						</td>
					</tr>
					</table>
			
				</td>
			</tr>
			</table>  
			<img border="0" src="images/spacer.gif" width="1" height="15" class="divider"><br>
			</layout>
			<layout label="Gallery highlights">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td bgcolor="#832701" nowrap><img border="0" src="images/spacer.gif" width="5" height="1"></td>
				<td width="100%" bgcolor="#ffffff">

					<table width="100%" cellpadding="20" cellspacing="0" border="0">
					<tr>
						<td bgcolor="#ffffff" class="contentblock">

							<h4 class="secondary"><strong><singleline label="Gallery title">Watch for us in</singleline></strong></h4>
							<multiline label="Gallery description"><p>Facebook, VK, Telegram</p></multiline>

						</td>
					</tr>
					</table>

				</td>
			</tr>
			</table>
 
			<img border="0" src="images/spacer.gif" width="1" height="15" class="divider"><br>
			</layout>	
		</repeater>           
		
		</td>
	</tr>
	</table>
	
	</td>
</tr>
</table>  	   			     	 

</body>
</html>

