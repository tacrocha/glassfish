FROM    glassfish:4.0
 
RUN       printf "AS_ADMIN_PASSWORD=\nAS_ADMIN_NEWPASSWORD=password\n" > pwd_change.txt && \
                printf "AS_ADMIN_PASSWORD=password\n" > pwd.txt
 
RUN       asadmin start-domain && \
                asadmin --passwordfile pwd_change.txt --user admin change-admin-password && \
                asadmin --host localhost --port 4848 --passwordfile pwd.txt enable-secure-admin && \
                asadmin stop-domain
               
CMD      asadmin start-domain --passwordfile pwd.txt --verbose
