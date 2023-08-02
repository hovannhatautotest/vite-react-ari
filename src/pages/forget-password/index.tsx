import React, { Fragment, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router';

import { Spin } from 'antd';
import { Form } from '@core/form';
import { GlobalFacade } from '@store';
import { routerLinks, language, languages } from '@utils';

const Page = () => {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const globalFacade = GlobalFacade();
  const lang = languages.indexOf(location.pathname.split('/')[1]) > -1 ? location.pathname.split('/')[1] : language;

  const { isLoading, status, data, forgotPassword } = globalFacade;
  useEffect(() => {
    if (status === 'forgotPassword.fulfilled') {
      navigate(`/${lang}${routerLinks('VerifyForotPassword')}`);
    }
  }, [status]);

  return (
    <Fragment>
      <div className="text-center mb-8">
        <h1
          className="intro-x text-3xl mb-8 font-bold text-green-900 leading-8 md:text-5xl lg:leading-10"
          id={'title-login'}
        >
          {t('columns.auth.login.Forgot Password')}
        </h1>
        <h5 className="intro-x font-normal text-green-900 ">{t('routes.auth.reset-password.subTitle')}</h5>
      </div>
      <div className="mx-auto w-3/4">
        <Spin spinning={isLoading}>
          <Form
            values={{ ...data }}
            className="intro-x form-forgetPassword"
            columns={[
              {
                name: 'email',
                title: t('columns.auth.reset-password.Recovery Email'),
                formItem: {
                  placeholder: 'columns.auth.reset-password.Recovery Email',
                  rules: [{ type: 'required' }, { type: 'email' }],
                },
              },
            ]}
            textSubmit={'routes.auth.reset-password.OTP'}
            handSubmit={(values) => forgotPassword({ ...values })}
            disableSubmit={isLoading}
          />
        </Spin>
        <div className="text-center mt-3">
          <button
            className={'text-sky-600 font-normal underline hover:no-underline hover:text-sky-500'}
            onClick={() => navigate(`/${lang}${routerLinks('Login')}`)}
          >
            {' '}
            {t('routes.auth.reset-password.Go back to login')}
          </button>
        </div>
      </div>
    </Fragment>
  );
};

export default Page;
