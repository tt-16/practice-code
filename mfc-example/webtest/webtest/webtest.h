
// webtest.h : webtest Ӧ�ó������ͷ�ļ�
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"       // ������


// CwebtestApp:
// �йش����ʵ�֣������ webtest.cpp
//

class CwebtestApp : public CWinApp
{
public:
	CwebtestApp();


// ��д
public:
	virtual BOOL InitInstance();

// ʵ��
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CwebtestApp theApp;
