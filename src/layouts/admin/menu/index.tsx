import { Collapse, Popover } from 'antd';
import React, { useEffect, useRef, useState } from 'react';
import classNames from 'classnames';
import { useNavigate, useLocation } from 'react-router';
import { useTranslation } from 'react-i18next';

import { language, languages, routerLinks } from '@utils';
import listMenu from '../menus';
import './index.less';
import { v4 } from 'uuid';

const Layout = ({ isCollapsed = false, permission = [] }: { isCollapsed: boolean; permission?: string[] }) => {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const location = useLocation();
  const refMenu = useRef<HTMLUListElement>(null);
  const clearTime = useRef<NodeJS.Timeout>();
  const lang = languages.indexOf(location.pathname.split('/')[1]) > -1 ? location.pathname.split('/')[1] : language;

  const [menuActive, set_menuActive] = useState<string[]>();
  useEffect(() => {
    clearTimeout(clearTime.current);
    let linkActive = '';
    listMenu().forEach((item: any) => {
      if (!linkActive && !!item.child && location.pathname.indexOf(`/${lang}${routerLinks(item.name)}`) > -1) {
        linkActive = `/${lang}${routerLinks(item.name)}`;
      }
    });
    clearTime.current = setTimeout(() => set_menuActive([linkActive]), 200);
  }, [location.pathname]);

  useEffect(() => {
    if (isCollapsed) {
      refMenu!.current!.scrollTop = 0;
    }
  }, [isCollapsed]);

  const subMenu = (child: { name: string; permission: string }[]) => (
    <ul>
      {child
        // .filter((subItem: any) => !subItem.permission || permission?.includes(subItem.permission))
        .map((subItem: any, index: number) => (
          <li className={classNames('group flex items-center pl-9 py-2 cursor-pointer rounded-2xl text-gray-300 font-medium text-base', {
            'bg-teal-700 text-white !fill-gray-300':
              location.pathname.indexOf(`/${lang}${routerLinks(subItem.name)}`) > -1,
          })}
            onClick={() => navigate(`/${lang}${routerLinks(subItem.name)}`)}
          >
            <p className='h-1 w-1 mr-3 rounded-lg bg-white group-hover:w-2 duration-300 ease-in-out transition-all'></p>
            <a
              className='hover:text-white sub-menu'
              key={index + v4()}
            >
              <span>{t(`titles.${subItem.name}`)}</span>
            </a>
          </li>
        ))}
    </ul>
  );

  const subMenu1 = (child: { name: string; permission: string }[]) => (
    <ul className="px-1 mx-2">
      {child
        .filter((subItem: any) => !subItem.permission || permission?.includes(subItem.permission))
        .map((subItem: any, index: number) => (
          <li
            key={index + v4()}
            className={classNames('child-item py-2 px-3 cursor-pointer rounded-2xl text-black font-medium text-base', {
              'bg-teal-700 text-white !fill-gray-300 justify-center flex':
                location.pathname.indexOf(`/${lang}${routerLinks(subItem.name)}`) > -1,
            })}
            onClick={() => navigate(`/${lang}${routerLinks(subItem.name)}`)}
          >
            {t(`titles.${subItem.name}`)}
          </li>
        ))}
    </ul>
  );

  return (
    <ul className="menu relative h-[calc(100vh-5rem)]" id={'menu-sidebar'} ref={refMenu}>
      {!!menuActive &&
        listMenu()
          .filter((item: any) => {
            return (
              !item.child ||
              item.child.filter((subItem: any) => !subItem.permission || permission?.includes(subItem.permission))
                .length > 0
            );
          })
          .map((item: any, index: number) => {
            if (!item.child) {
              return (
                <li
                  className={classNames('flex items-center text-gray-300 h-12 m-3 relative cursor-pointer py-1', {
                    'bg-teal-700 text-white !fill-gray-300 rounded-2xl opacity-100':
                      location.pathname === `/${lang}${routerLinks(item.name)}`,
                    'fill-gray-300': location.pathname !== `/${lang}${routerLinks(item.name)}`,
                    'justify-center': isCollapsed,
                  })}
                  onClick={() => navigate(`/${lang}${routerLinks(item.name)}`)}
                  key={index}
                >
                  {/* <img src={item.icon} className='h-8  w-8 block text-slate-700 fill-red-700'/> */}
                  {/* {item.icon} */}
                  <div className={classNames({ absolute: isCollapsed })}>{item.icon}</div>
                  <span
                    className={classNames('ml-2.5 transition-all duration-300 ease-in-out font-medium text-base !h-8 flex items-center', {
                      'opacity-100': !isCollapsed,
                      'hidden': isCollapsed,
                    })}
                  >
                    {t(`titles.${item.name}`)}
                  </span>
                </li>
              );
            } else {
              return isCollapsed ? (
                <Popover key={index} placement="rightTop" trigger={'hover'} content={subMenu1(item.child)}>
                  <li className="flex items-center justify-center h-11 m-3 px-2 text-gray-300 fill-gray-300 ">
                    {/* <img src={item.icon} className={classNames('h-8  w-8 block !fill-red-700', { 'ml-1': !isCollapsed})}/> */}
                    <div className={classNames({ 'ml-1': !isCollapsed })}>{item.icon}</div>
                  </li>
                </Popover>
              ) : (
                <li className="my-3" key={index}>
                  <Collapse
                    accordion
                    bordered={false}
                    className={classNames('bg-teal-900', {
                      'active-menu': location.pathname.indexOf(`/${lang}${routerLinks(item.name)}`) > -1,
                    })}
                    defaultActiveKey={menuActive}
                  >
                    <Collapse.Panel
                      key={`/${lang}${routerLinks(item.name)}`}
                      showArrow={!isCollapsed}
                      header={
                        <div
                          className={classNames('flex items-center text-gray-300 fill-gray-300  ', {
                            'justify-center ': isCollapsed,
                          })}
                        >
                          {/* <img src={item.icon} className={classNames('h-8 w-8 block !fill-red-700', { 'ml-1': !isCollapsed})}/> */}
                          <div className={classNames({ 'ml-1': !isCollapsed })}>{item.icon}</div>
                          <span
                            className={classNames(
                              'pl-2.5 transition-all duration-300 ease-in-out font-medium text-base text-gray-300',
                              {
                                'opacity-100': !isCollapsed,
                                'opacity-0 text-[0]': isCollapsed,
                              },
                            )}
                          >
                            {t(`titles.${item.name}`)}
                          </span>
                        </div>
                      }
                    >
                      {subMenu(item.child)}
                    </Collapse.Panel>
                  </Collapse>
                </li>
              );
            }
          })}
    </ul>
  );
};
export default Layout;
