FROM keimoon/common-ubuntu:latest

MAINTAINER keimoonvie@gmail.com

WORKDIR /home/ubuntu
RUN sudo apt-get clean && sudo apt-get update && sudo apt-get install -y zsh emacs24-nox nano ssh && sudo chsh -s /bin/zsh ubuntu
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
ADD keimoon.zsh-theme /home/ubuntu/.oh-my-zsh/themes
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="keimoon"/' .zshrc && \
    echo 'export GOPATH="/home/deploy/go"' >> .zshrc \
    && echo 'export JDK_HOME=/usr/lib/jvm/jdk1.8.0_77' >> .zshrc \
    && echo 'export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_77' >> .zshrc \
    && echo 'export PATH="$JAVA_HOME/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"' >> .zshrc
ADD .emacs /home/ubuntu
ADD emacs-install-pkg.el /home/ubuntu

RUN emacs --batch --eval "(defconst pkg-to-install 'go-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'scala-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'sbt-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'typescript-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'sass-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'less-css-mode)" -l emacs-install-pkg.el

RUN rm emacs-install-pkg.el
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker_key.pub /home/ubuntu
RUN mkdir .ssh && cat docker_key.pub > .ssh/authorized_keys && rm docker_key.pub
EXPOSE 22
CMD /bin/zsh
