FROM archlinux/base
RUN pacman --noconfirm -Sy git ansible
COPY . /dotFiles
WORKDIR dotFiles
ENTRYPOINT ["./site.yml"]
CMD ["-i hosts", "-v"]
