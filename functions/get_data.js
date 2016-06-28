			var server = false
			if (server) {
			  d3.json("data/data.json", function(data) {
			      console.log(data);
				  })
				  } else {
			      var fileref = document.createElement('script')
			      fileref.setAttribute("type", "text/javascript")
				  fileref.setAttribute("charset", "utf-8")
			      fileref.setAttribute("src", "data/data.js")
				  
				  document.head.appendChild(fileref);
			    };
				