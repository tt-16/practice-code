
// crackMe01.h : PROJECT_NAME ���ó�ʽ����Ҫ���^�n
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�� PCH �����˙n��ǰ�Ȱ��� 'stdafx.h'"
#endif

#include "resource.h"		// ��Ҫ��̖


// CcrackMe01App: 
// Ո��醌�����e�� crackMe01.cpp
//

class CcrackMe01App : public CWinApp
{
public:
	CcrackMe01App();

// ����
public:
	virtual BOOL InitInstance();

// ��ʽ�a����

	DECLARE_MESSAGE_MAP()
};

extern CcrackMe01App theApp;