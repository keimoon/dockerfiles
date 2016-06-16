FROM keimoon/common:latest

MAINTAINER keimoonvie@gmail.com

RUN yum install -y zsh emacs-nox nano && chsh -s /bin/zsh deploy

USER deploy
WORKDIR /home/deploy
RUN git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
ADD keimoon.zsh-theme /home/deploy/.oh-my-zsh/themes
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="keimoon"/' .zshrc && \
    echo 'export GOPATH="/home/deploy/go"' >> .zshrc && echo 'export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"' >> .zshrc
ADD .emacs /home/deploy
ADD emacs-install-pkg.el /home/deploy

RUN emacs --batch --eval "(defconst pkg-to-install 'go-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'scala-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'sbt-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'typescript-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'sass-mode)" -l emacs-install-pkg.el && \
    emacs --batch --eval "(defconst pkg-to-install 'less-css-mode)" -l emacs-install-pkg.el

RUN rm emacs-install-pkg.el

CMD /bin/zsh
