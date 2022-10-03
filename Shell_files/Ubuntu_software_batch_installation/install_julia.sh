# way1: 
# use apt-get to install the current stable version
sudo apt-get install julia

# way2: 
# got to https://julialang.org/downloads/
# download long-term support version

cd ~/Download/

#  Next, go on your terminal and unzip the downloaded file.
tar -xvzf julia-1.6.x-linux-x86_64.tar.gz

# You now have a folder with all the Julia files. No installation is required. Now, we move this folder to “/opt”
sudo mv julia-1.6.x/ /opt/

# Finally, create a symbolic link to the Julia binary file. This will allow you to run the command “julia” in your terminal and start the Julia REPL.
sudo ln -s /opt/julia-1.6.x/bin/julia /usr/local/bin/julia


# launch julia
julia


# switch from Julia mode to Pkg mode
julia> ]

# add Pluto
pkg> add Pluto

# start Pluto
julia> using Pluto
 
# run Pluto
julia> Pluto.run()
